import 'package:flutter/material.dart';
import 'package:room_box_app/api/vouchers-service.dart';
import 'package:room_box_app/models/responses/voucher-response.dart';
import 'package:room_box_app/pages/app/user/vouchers/voucher-details.dart';

import '../../../../components/cards/voucher-card.dart';

class UserVouchers extends StatefulWidget {
  const UserVouchers({super.key});

  @override
  State<UserVouchers> createState() => _UserVouchersState();
}

class _UserVouchersState extends State<UserVouchers> {
  List<VoucherResponse> voucherList = [];
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

    List<VoucherResponse> data = await vouchersService.getAllVouchers();

    setState(() {
      voucherList = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Historial de Vouchers"),
        ),
        body: Center(
          child: isLoading ? CircularProgressIndicator() : Expanded(
            child: ListView.builder(
                itemCount: voucherList.length,
                itemBuilder: (context, index) {
                  if (voucherList.length > 0) {
                    VoucherResponse currentVoucher = voucherList[index];

                    return VoucherCard(
                      voucherID: currentVoucher.voucherId.toString(),
                      alias: currentVoucher.paymentDetails,
                      paymentDetails: currentVoucher.paymentMethod,
                      date: currentVoucher.voucherDateDisplay,
                    );
                  }

                  return null;
                }),
          ),
        ));
  }
}
