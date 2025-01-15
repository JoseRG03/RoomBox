class Article {
  final int articleId;
  final dynamic imageUrl;
  final dynamic client;
  final String articleName;
  final int articleStock;
  final String articleUnitPrice;
  final bool articleStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic image;

  Article({
    required this.articleId,
    required this.imageUrl,
    required this.client,
    required this.articleName,
    required this.articleStock,
    required this.articleUnitPrice,
    required this.articleStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    articleId: json["article_id"],
    imageUrl: json["image_url"],
    client: json["client"],
    articleName: json["article_name"],
    articleStock: json["article_stock"],
    articleUnitPrice: json["article_unit_price"],
    articleStatus: json["article_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "article_id": articleId,
    "image_url": imageUrl,
    "client": client,
    "article_name": articleName,
    "article_stock": articleStock,
    "article_unit_price": articleUnitPrice,
    "article_status": articleStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image,
  };
}