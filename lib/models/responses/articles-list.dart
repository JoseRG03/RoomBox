import 'article.dart';

class ArticleList {
  final int count;
  final dynamic next;
  final dynamic previous;
  final List<Article> results;

  ArticleList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ArticleList.fromJson(Map<String, dynamic> json) => ArticleList(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Article>.from(json["results"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}