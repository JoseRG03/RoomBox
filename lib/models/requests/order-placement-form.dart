class OrderPlacementForm {
  final String orderAmount;
  final String orderStatus;

  OrderPlacementForm({
    required this.orderAmount,
    required this.orderStatus,
  });

  factory OrderPlacementForm.fromJson(Map<String, dynamic> json) => OrderPlacementForm(
    orderAmount: json["order_amount"],
    orderStatus: json["order_status"],
  );

  Map<String, dynamic> toJson() => {
    "order_amount": orderAmount,
    "order_status": orderStatus,
  };
}