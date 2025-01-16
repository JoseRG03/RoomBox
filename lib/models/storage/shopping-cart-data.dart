import 'package:room_box_app/models/storage/shopping_cart_item.dart';
import 'package:room_box_app/pages/app/store/total-costs.dart';

class ShoppingCartData {
  final List<ShoppingCartItem> items;
  final TotalCosts totalCosts;

  ShoppingCartData({required this.items, required this.totalCosts});
}