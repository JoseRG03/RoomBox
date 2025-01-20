import 'package:room_box_app/models/responses/voucher-response.dart';

class VouchersList {
  final int count;
  final dynamic next;
  final dynamic previous;
  final List<VoucherResponse> results;

  VouchersList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory VouchersList.fromJson(Map<String, dynamic> json) => VouchersList(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<VoucherResponse>.from(json["results"].map((x) => VoucherResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}