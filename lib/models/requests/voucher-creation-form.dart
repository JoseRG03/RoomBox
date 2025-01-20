class VoucherCreationForm {
  final String paymentMethod;
  final String paymentDetails;
  final String subtotal;
  final String taxAmount;
  final String totalAmount;
  final String voucherStatus;
  final String clientId;
  final String orderId;

  VoucherCreationForm({
    required this.paymentMethod,
    required this.paymentDetails,
    required this.subtotal,
    required this.taxAmount,
    required this.totalAmount,
    required this.voucherStatus, required this.clientId, required this.orderId
  });

  factory VoucherCreationForm.fromJson(Map<String, dynamic> json) => VoucherCreationForm(
    paymentMethod: json["payment_method"],
    paymentDetails: json["payment_details"],
    subtotal: json["subtotal"],
    taxAmount: json["tax_amount"],
    totalAmount: json["total_amount"],
    voucherStatus: json["voucher_status"],
    clientId: json["client_id"],
    orderId: json["order_id"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod,
    "payment_details": paymentDetails,
    "subtotal": subtotal,
    "tax_amount": taxAmount,
    "total_amount": totalAmount,
    "voucher_status": voucherStatus,
    "client_id": clientId,
    "order_id": orderId,
  };
}
