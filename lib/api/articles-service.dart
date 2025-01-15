import 'package:room_box_app/api/database-service.dart';

import '../models/responses/article.dart';
import '../models/responses/articles-list.dart';
import 'networking.dart';

class ArticlesService {

  Future<List<Article>> getAllArticles() async{
    DatabaseService db = DatabaseService.instance;
    Networking networking = Networking(urlSection: 'articles/');

    var userData = await db.getUserData();
    Map<String, String> headers = {'Authorization': 'Bearer ${userData.jwt ?? ''}'};

    final data = await networking.getData(headers);

    try {
      ArticleList articlesData = ArticleList.fromJson(data);
      return articlesData.results;
    } catch (err) {
      print('Error: $err');
      return [];
    }
  }

  Future<Article?> getArticle(String articleID) async{
    DatabaseService db = DatabaseService.instance;
    Networking networking = Networking(urlSection: 'articles/$articleID/');

    var userData = await db.getUserData();
    Map<String, String> headers = {'Authorization': 'Bearer ${userData.jwt ?? ''}'};

    final data = await networking.getData(headers);

    try {
      Article articlesData = Article.fromJson(data);
      return articlesData;
    } catch (err) {
      print('Error: $err');
      return null;
    }
  }
}
