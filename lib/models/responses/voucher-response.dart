import 'package:room_box_app/models/responses/voucher-article.dart';

class VoucherResponse {
  final int voucherId;
  final DateTime voucherDate;
  final String voucherDateDisplay;
  final String paymentMethod;
  final String paymentDetails;
  final String clientName;
  final String subtotal;
  final String taxAmount;
  final String totalAmount;
  final String voucherStatus;
  final List<VoucherArticle> articles;

  VoucherResponse({
    required this.voucherId,
    required this.voucherDate,
    required this.voucherDateDisplay,
    required this.paymentMethod,
    required this.paymentDetails,
    required this.clientName,
    required this.subtotal,
    required this.taxAmount,
    required this.totalAmount,
    required this.voucherStatus,
    required this.articles,
  });

  factory VoucherResponse.fromJson(Map<String, dynamic> json) => VoucherResponse(
    voucherId: json["voucher_id"],
    voucherDate: DateTime.parse(json["voucher_date"]),
    voucherDateDisplay: json["voucher_date_display"],
    paymentMethod: json["payment_method"],
    paymentDetails: json["payment_details"],
    clientName: json["client_name"],
    subtotal: json["subtotal"],
    taxAmount: json["tax_amount"],
    totalAmount: json["total_amount"],
    voucherStatus: json["voucher_status"],
    articles: List<VoucherArticle>.from(json["articles"].map((x) => VoucherArticle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "voucher_id": voucherId,
    "voucher_date": voucherDate.toIso8601String(),
    "voucher_date_display": voucherDateDisplay,
    "payment_method": paymentMethod,
    "payment_details": paymentDetails,
    "client_name": clientName,
    "subtotal": subtotal,
    "tax_amount": taxAmount,
    "total_amount": totalAmount,
    "voucher_status": voucherStatus,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

