class OrderResponse {
  final int orderId;
  final String orderAmount;
  final dynamic orderDatePlaced;
  final dynamic orderDatePayment;
  final dynamic orderDateDelivered;
  final String orderStatus;
  final dynamic createdAt;

  OrderResponse({
    required this.orderId,
    required this.orderAmount,
    required this.orderDatePlaced,
    required this.orderDatePayment,
    required this.orderDateDelivered,
    required this.orderStatus,
    required this.createdAt,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    orderId: json["order_id"],
    orderAmount: json["order_amount"],
    orderDatePlaced: json["order_date_placed"],
    orderDatePayment: json["order_date_payment"],
    orderDateDelivered: json["order_date_delivered"],
    orderStatus: json["order_status"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_amount": orderAmount,
    "order_date_placed": orderDatePlaced,
    "order_date_payment": orderDatePayment,
    "order_date_delivered": orderDateDelivered,
    "order_status": orderStatus,
    "created_at": createdAt,
  };
}
