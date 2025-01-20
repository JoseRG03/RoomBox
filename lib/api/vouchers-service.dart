import 'package:room_box_app/models/responses/voucher-response.dart';
import 'package:room_box_app/models/responses/vouchers-list.dart';

import 'database-service.dart';
import 'networking.dart';

class VouchersService {
  Future<List<VoucherResponse>> getAllVouchers() async{
    DatabaseService db = DatabaseService.instance;
    Networking networking = Networking(urlSection: 'vouchers/');

    var userData = await db.getUserData();
    Map<String, String> headers = {'Authorization': 'Bearer ${userData.jwt ?? ''}'};

    final data = await networking.getData(headers);

    print(data);
    try {
      VouchersList vouchersList = VouchersList.fromJson(data);
      return vouchersList.results;
    } catch (err) {
      print('Error: $err');
      return [];
    }
  }

  Future<VoucherResponse?> getVoucher(String id) async{
    DatabaseService db = DatabaseService.instance;
    Networking networking = Networking(urlSection: 'vouchers/$id');

    var userData = await db.getUserData();
    Map<String, String> headers = {'Authorization': 'Bearer ${userData.jwt ?? ''}'};

    final data = await networking.getData(headers);

    print(data);
    try {
      VoucherResponse voucherResponse = VoucherResponse.fromJson(data);
      return voucherResponse;
    } catch (err) {
      print('Error: $err');
      return null;
    }
  }
}