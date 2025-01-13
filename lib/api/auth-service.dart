import 'package:room_box_app/models/requests/login-form.dart';

import '../models/error.dart';
import 'networking.dart';

Future<int> login(LoginForm loginRequest) async {
  Networking apiHandler = Networking(urlSection: 'auth/login/');
  int statusCode;

  try {
    var response = await apiHandler.postData(loginRequest.toJson(), null);

    if (response is GenericAPIError) {
      statusCode = response.statusCode;
    } else {

      return 200;
    }
  } catch (err) {
    statusCode = 500;
  };

  return statusCode;
}