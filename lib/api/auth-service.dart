import 'package:room_box_app/api/database-service.dart';
import 'package:room_box_app/models/requests/login-form.dart';
import 'package:room_box_app/models/responses/login-response.dart';

import '../models/error.dart';
import 'networking.dart';

Future<int> login(LoginForm loginRequest) async {
  Networking apiHandler = Networking(urlSection: 'auth/login/');
  int statusCode;
  final DatabaseService db = DatabaseService.instance;

  await db.clearUserData();

  try {
    var response = await apiHandler.postData(loginRequest.toJson(), null);

    LoginResponse loginData = LoginResponse.fromJson(response);


    if (response is GenericAPIError) {
      statusCode = response.statusCode;
    } else {
      if (loginData.access != null && loginData.refresh != null) {
        db.addUserData(loginData.access ?? '', loginData.refresh ?? '');
        return 200;
      } else {
        return 500;
      }
    }
  } catch (err) {
    print(err);
    statusCode = 500;
  };

  return statusCode;
}