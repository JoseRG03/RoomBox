import 'package:room_box_app/api/database-service.dart';
import 'package:room_box_app/models/requests/order-articles-form.dart';
import 'package:room_box_app/models/requests/order-placement-form.dart';
import 'package:room_box_app/models/requests/voucher-creation-form.dart';
import 'package:room_box_app/models/storage/payment-method.dart';
import 'package:room_box_app/models/storage/shopping-cart-data.dart';

import '../models/responses/order-response.dart';
import 'networking.dart';

class OrdersService {
  Future<int?> placeOrder(PaymentMethod? paymentMethod, String? subtotal, String? tax, String? total) async {
    final DatabaseService db = DatabaseService.instance;
    Networking networking = Networking(urlSection: 'orders/');
    Networking itemNetworking = Networking(urlSection: 'order-articles/');
    Networking voucherNetworking = Networking(urlSection: 'vouchers/');
    int amount = 0;

    try {
      var userData = await db.getUserData();
      final ShoppingCartData cart = await db.getShoppingCart();
      cart.items.forEach((item) {
        amount += item.shoppingCartItemAmount;
      });

      OrderPlacementForm request = OrderPlacementForm(
          orderAmount: amount.toString(), orderStatus: true.toString());

      Map<String, String> headers = {
        'Authorization': 'Bearer ${userData.jwt ?? ''}'
      };

      final response = await networking.postData(request.toJson(), headers);

      OrderResponse orderData = OrderResponse.fromJson(response);

      if (orderData.orderId == null) return 1;

      cart.items.forEach((item) async {
        OrderArticlesForm req = OrderArticlesForm(
            article: item.shoppingCartItemId.toString(),
            order: orderData.orderId.toString() ?? "",
            article_quantity: item.shoppingCartItemAmount.toString(),
            article_unit_price: item.shoppingCartUnitPrice.toString());

        final itemResponse = await itemNetworking.postData(req.toJson(), headers);
      });

      VoucherCreationForm voucherRequest = VoucherCreationForm(
          paymentMethod: (paymentMethod?.number ?? "").toString(),
          paymentDetails: paymentMethod?.alias ?? "",
          subtotal: subtotal ?? '',
          taxAmount: tax ?? '',
          totalAmount: total ?? '',
          voucherStatus: "COMPLETED",
          clientId: "1",
          orderId: orderData.orderId.toString());

      final voucherResponse = await voucherNetworking.postData(voucherRequest.toJson(), headers);

      return 0;
    } catch (err) {
      return 1;
    }

  }
}
