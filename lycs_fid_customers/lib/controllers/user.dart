import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/model/article.dart';
import 'package:lycs_fid_customers/database/databasehelper.dart';

class UserController with ChangeNotifier {
  Client _client = Client();
  List<Article> _articles = [];

  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMywidXNlcm5hbWUiOiJka0BleGFtcGxlLmNvbSIsImV4cCI6MTcwMDY1NDM3NSwiZW1haWwiOiJka0BleGFtcGxlLmNvbSJ9.eZebzzjMuzv0xbhSbDAgLMeOdv-HIyHfJ5ZGta8dN_E';

  set setClient(Client client) => () {
        //_client = client;
        _client.setId = client.id;
        _client.setLastName = client.lastName;
        _client.setFirstName = client.firstName;
        _client.setEmail = client.email;
        _client.setAdresse = client.adresse;
        _client.setPassword = client.password;
        _client.setPhone = client.phone;
        notifyListeners();
      };

  Client get getClient => _client;

  Future<dynamic> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://lycsfid.onrender.com/api/v1/login/'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'X-CSRFToken': token,
      },
      body: jsonEncode(<String, String>{
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Connexion réussie');
      //print('Response body ${response.body}');
      print('Status Code : ${response.statusCode}');
      _client = Client.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      print('Connection a la base de données');
      await DatabaseHelper.getDB();
      print('Ajout du client dans la base de données');
      await DatabaseHelper.addClient(_client);
      print(_client.toJson());
      return _client;
    } else {
      print('Erreur lors de la connexion');
      print('StatusCode: ${response.statusCode}');
      print('Response: ${utf8.decode(response.bodyBytes)}');
    }
  }

  Future<void> createAccount(Client client) async {
    final response = await http.post(
      Uri.parse('https://lycsfid.onrender.com/api/v1/clients'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'X-CSRFToken': token,
      },
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 201) {
      print('Compte créé avec succès');
      print('StatusCode: ${response.statusCode}');
      print('Response: ${response.body}');
    } else {
      print('Erreur lors de la création du compte');
      print('StatusCode: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  // Recupérer l'ensemble des articles
  Future<List<Article>> getAllArticle() {
    return Future.value(_articles);
  }
}
