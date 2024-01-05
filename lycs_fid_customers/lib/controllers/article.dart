// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lycs_fid_customers/model/article.dart';
import 'package:lycs_fid_customers/model/bon_de_reduction.dart';
import 'package:lycs_fid_customers/model/campagne.dart';

class ArticleController with ChangeNotifier {
  final List<Article> _articles = [];
  final List<Campagne> _campagnes = [];
  final List<BonDeReduction> _bons = [];
  String token =
      'UDQW4h3SRHMbiiru7RaRgZguuwTcthbPrAjJ41uigtIXRuf4jAf9v6KJ5p3xWjDu';

  set setArticle(Article article) => () {
        _articles.add(article);
        notifyListeners();
      };

  Article get getArticle => _articles[0];

  // Recupérer l'ensemble des articles
  Future<ArticleResponse> getAllArticles() async {
    final response = await http.get(
      Uri.parse('https://lycsfid.onrender.com/api/v1/articles/'),
      headers: <String, String>{
        'accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8',
        'X-CSRFToken': token,
      },
    );

    if (response.statusCode == 200) {
      // Si le serveur retourne un code de réponse 200 OK, alors parse le JSON.
      return ArticleResponse.fromJson({
        'statusCode': response.statusCode,
        'data': utf8.decode(response.bodyBytes),
        'error': null,
      });
    } else {
      // Si le serveur retourne une réponse avec un code d'erreur, alors lève une exception.
      throw Exception(jsonDecode(response.body)['detail']);
    }
  }

  // Recupérer l'ensemble des campagnes
  Future<ArticleResponse>? getAllCampagnes() async {
    final response = await http.get(
      Uri.parse('https://lycsfid.onrender.com/api/v1/campagnes/'),
      headers: <String, String>{
        'accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8',
        'X-CSRFToken': token,
      },
    );

    if (response.statusCode == 200) {
      // Si le serveur retourne un code de réponse 200 OK, alors parse le JSON.
      return ArticleResponse.fromJson({
        'statusCode': response.statusCode,
        'data': utf8.decode(response.bodyBytes),
        'error': null,
      });
    } else {
      // Si le serveur retourne une réponse avec un code d'erreur, alors lève une exception.
      throw Exception(jsonDecode(response.body)['detail']);
    }
  }

  Future<ArticleResponse>? getAllBons() async {
    final response = await http.get(
      Uri.parse('https://lycsfid.onrender.com/api/v1/bon/'),
      headers: <String, String>{
        'accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8',
        'X-CSRFToken': token,
      },
    );

    if (response.statusCode == 200) {
      // Si le serveur retourne un code de réponse 200 OK, alors parse le JSON.
      return ArticleResponse.fromJson({
        'statusCode': response.statusCode,
        'data': utf8.decode(response.bodyBytes),
        'error': null,
      });
    } else {
      // Si le serveur retourne une réponse avec un code d'erreur, alors lève une exception.
      throw Exception(jsonDecode(response.body)['detail']);
    }
  }

  // Recupérer la liste des articles
  List<Article> listArticles(ArticleResponse data) {
    Map<String, dynamic> body = jsonDecode(data.data!);
    List<dynamic> datas = body['data'].toList();
    print("Affichage des données");
    //print(data);
    int i = 0;
    for (dynamic item in datas) {
      print('Item : $item');
      _articles.add(Article.fromJson(item));
      i++;
    }
    return _articles;
  }

  // Recupérer la liste des campagnes
  List<Campagne> listCampagnes(ArticleResponse data) {
    Map<String, dynamic> body = jsonDecode(data.data!);
    List<dynamic> datas = body['data'].toList();
    print("Affichage des données");
    print(data);
    int i = 0;
    for (dynamic item in datas) {
      print('Item : $item');
      _campagnes.add(Campagne.fromJson(item));
      i++;
    }
    return _campagnes;
  }

  // Recupérer la liste des Bons
  List<BonDeReduction> listBons(ArticleResponse data) {
    Map<String, dynamic> body = jsonDecode(data.data!);
    List<dynamic> datas = body['data'].toList();
    print("Affichage des données");
    print(data);
    int i = 0;
    for (dynamic item in datas) {
      print('Item : $item');
      _bons.add(BonDeReduction.fromJson(item));
      i++;
    }
    return _bons;
  }
}

class ArticleResponse {
  int? statusCode;
  String? data;
  String? error;

  ArticleResponse({this.statusCode, this.data, this.error});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        statusCode: json['statusCode'].toInt(),
        data: json['data'],
        error: json['error'],
      );
}
