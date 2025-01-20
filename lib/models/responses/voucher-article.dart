class VoucherArticle {
  final String articleName;
  final int articleQuantity;
  final String articleUnitPrice;

  VoucherArticle({
    required this.articleName,
    required this.articleQuantity,
    required this.articleUnitPrice,
  });

  factory VoucherArticle.fromJson(Map<String, dynamic> json) => VoucherArticle(
    articleName: json["article_name"],
    articleQuantity: json["article_quantity"],
    articleUnitPrice: json["article_unit_price"],
  );

  Map<String, dynamic> toJson() => {
    "article_name": articleName,
    "article_quantity": articleQuantity,
    "article_unit_price": articleUnitPrice,
  };
}