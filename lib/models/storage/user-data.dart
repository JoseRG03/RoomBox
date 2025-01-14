class UserData {
  String? jwt;
  String? refresh;

  UserData({required this.jwt, required this.refresh});

  UserData.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    jwt = json['jwt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.jwt;
    return data;
  }
}
