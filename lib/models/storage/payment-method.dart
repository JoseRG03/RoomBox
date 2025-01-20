class PaymentMethod {
  final String id;
  final String alias;
  final int number;
  final String image;
  final int isCurrent;

  PaymentMethod({required this.isCurrent, required this.id, required this.alias, required this.number, required this.image});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
        return PaymentMethod(
          id: json['payment_method_id'].toString(),
          alias: json["payment_method_alias"],
          number: json["payment_method_number"],
          image: json["payment_method_image"],
          isCurrent: json["payment_method_current"],
        );
      }
}
