import 'package:flutter/material.dart';
import 'package:room_box_app/api/vouchers-service.dart';
import 'package:room_box_app/const.dart';
import 'package:room_box_app/models/responses/voucher-article.dart';
import 'package:room_box_app/models/responses/voucher-response.dart';
import 'package:room_box_app/models/storage/payment-method.dart';

import '../../../../components/cards/cart-item-card.dart';
import '../../../../components/cards/payment-method-card.dart';

class ViewVoucher extends StatefulWidget {
  const ViewVoucher({super.key, required this.voucherID});

  final String voucherID;

  @override
  State<ViewVoucher> createState() => _ViewVoucherState();
}

class _ViewVoucherState extends State<ViewVoucher> {
  VoucherResponse currentVoucher = VoucherResponse(
      voucherId: 1,
      voucherDate: DateTime.now(),
      voucherDateDisplay: '',
      paymentMethod: '0',
      paymentDetails: '',
      clientName: '',
      subtotal: '',
      taxAmount: '',
      totalAmount: '',
      voucherStatus: '',
      articles: []);
  List<VoucherArticle> articlesList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getInitialData();
  }

  void getInitialData() async {
    setState(() {
      isLoading = true;
    });
    VouchersService vouchersService = VouchersService();

    VoucherResponse? data = await vouchersService.getVoucher(widget.voucherID);

    setState(() {
      if (data != null) currentVoucher = data;
      articlesList = data?.articles ?? [];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading
            ? Center(child: CircularProgressIndicator())
            : Text('Detalles: ${currentVoucher.voucherDateDisplay}'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Artículos Comprados',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              isLoading
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: ListView.builder(
                          itemCount: articlesList.length ?? 0,
                          itemBuilder: (context, index) {
                            if (currentVoucher?.articles == null ||
                                index >= currentVoucher!.articles.length) {
                              return SizedBox.shrink();
                            }

                            VoucherArticle? article = articlesList[index];
                            return CartItemCard(
                                isEditable: false,
                                title: article.articleName ?? "",
                                cost: double.parse(
                                    article.articleUnitPrice ?? '0.00'),
                                units: article.articleQuantity ?? 0,
                                imageUrl: baseImageURL,
                                itemId: '0');
                          }),
                    ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('\$${currentVoucher?.subtotal ?? ""} DOP',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Impuestos:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('\$${currentVoucher?.taxAmount ?? ""} DOP',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('\$${currentVoucher?.totalAmount ?? ""} DOP',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Método de pago:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      )),
                  SelectedPaymentMethodCard(
                    isEditable: false,
                    paymentMethod: PaymentMethod(
                        isCurrent: 0,
                        id: '1',
                        alias: currentVoucher.paymentDetails ?? "",
                        number: int.parse(currentVoucher.paymentMethod ?? '0'),
                        image: getPaymentMethodImage(
                            currentVoucher.paymentMethod ?? '')),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
