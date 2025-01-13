class LoginResponse {
  String? refresh;
  String? access;
  String? userType;
  String? error;

  LoginResponse({this.refresh, this.access, this.userType});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    userType = json['user_type'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    data['user_type'] = this.userType;
    return data;
  }
}