class OrderArticlesForm {
  final String order;
  final String article_quantity;
  final String article_unit_price;
  final String article;

  OrderArticlesForm(
      {required this.order,
      required this.article_quantity,
      required this.article_unit_price,
      required this.article});

  Map<String, dynamic> toJson() => {
    "order": order,
    "article_quantity": article_quantity,
    "article_unit_price": article_unit_price,
    "article": article,
  };
}
