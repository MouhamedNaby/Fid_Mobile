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
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywidXNlcm5hbWUiOiJka0BleGFtcGxlLmNvbSIsImV4cCI6MTcwMDY1NDM3NSwiZW1haWwiOiJka0BleGFtcGxlLmNvbSJ9.eZebzzjMuzv0xbhSbDAgLMeOdv-HIyHfJ5ZGta8dN_E';

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
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken':
            'YVnbeRwzpn2WykJi3F0pYl5OeUhzLashEptQMbgAkHjmetDbHiWjK2TkgVeNC7kQ',
      },
    );

    if (response.statusCode == 200) {
      print('Connexion article réussie ${response.statusCode}');
    } else {
      print('Erreur lors de la connexion');
      print('StatusCode: ${response.statusCode}');
      print('Response: ${response.body}');
    }

    return ArticleResponse.fromJson({
      'statusCode': response.statusCode,
      'data': response.body,
      'error': null,
    });
  }

  // Recupérer l'ensemble des campagnes
  Future<ArticleResponse>? getAllCampagnes() async {
    final response = await http.get(
      Uri.parse('https://lycsfid.onrender.com/api/v1/campagnes/'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken': token,
      },
    );

    if (response.statusCode == 200) {
      print('Connexion campagne réussie');
    } else {
      print('Erreur lors de la connexion campagne');
      print('StatusCode campagne: ${response.statusCode}');
      print('Response campagne: ${response.body}');
    }
    return ArticleResponse.fromJson({
      'statusCode': response.statusCode,
      'data': response.body,
      'error': null,
    });
  }

  Future<ArticleResponse>? getAllBons() async {
    final response = await http.get(
      Uri.parse('https://lycsfid.onrender.com/api/v1/bon/'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken': token,
      },
    );

    if (response.statusCode == 200) {
      print('Connexion campagne réussie');
    } else {
      print('Erreur lors de la connexion campagne');
      print('StatusCode campagne: ${response.statusCode}');
      print('Response campagne: ${response.body}');
    }
    return ArticleResponse.fromJson({
      'statusCode': response.statusCode,
      'data': response.body,
      'error': null,
    });
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
