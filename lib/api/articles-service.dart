import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:room_box_app/api/database-service.dart';

import '../models/responses/article.dart';
import '../models/responses/articles-list.dart';
import 'networking.dart';

class ArticlesService {

  Future<String> _loadAssets(String path) async {
    return rootBundle.loadString(path);
  }

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

    print('Data: ${data}');

    try {
      Article articlesData = Article.fromJson(data);
      return articlesData;
    } catch (err) {
      print('Error: $err');
      return null;
    }
  }


  Future<List<Article>> getFeaturedArticles() async {

    await Future.delayed(const Duration(milliseconds: 300));

    //Se trae el json desde nuestro archivo
    final data = await _loadAssets('assets/data-mock/mock-featured.json');

    //Se convierte el json a un mapa
    final Map<String, dynamic> json = jsonDecode(data);


    // Se navega el mapa y se convierte a objetos tipo SimpleRecipe
    if (json['results'] != null) {
      final results = <Article>[];
      json['results'].forEach((value){
        results.add(Article.fromJson(value));
      });

      return results; //Devolvemos la lista de objetos SimpleRecipes
    }

    return []; //Si tira error retorna una lista vacía
  }
}
