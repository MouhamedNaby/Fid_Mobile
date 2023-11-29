import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/model/article.dart';

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

  Future<ClientResponse>? login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://lycsfid.onrender.com/api/v1/login/'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken': token,
      },
      body: jsonEncode(<String, String>{
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Connexion réussie');
      print('Status Code : ${response.statusCode}');
    } else {
      print('Erreur lors de la connexion');
      print('StatusCode: ${response.statusCode}');
      print('Response: ${response.body}');
    }
    return ClientResponse.fromJson({
      'statusCode': response.statusCode,
      'data': response.body,
      'error': null,
    });
  }

  Future<ClientResponse>? createAccount(Client client) async {
    final response = await http.post(
      Uri.parse('https://lycsfid.onrender.com/api/v1/clients'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken': token,
      },
      body: jsonEncode(client.toJson()),
    );

    print('Compte créé avec succès');
    print('StatusCode: ${response.statusCode}');
    print('Response: ${response.body}');

    return ClientResponse.fromJson({
      'statusCode': response.statusCode,
      'data': response.body,
      'error': null,
    });
  }
}

class ClientResponse {
  int? statusCode;
  String? data;
  String? error;

  ClientResponse({this.statusCode, this.data, this.error});

  factory ClientResponse.fromJson(Map<String, dynamic> json) => ClientResponse(
        statusCode: json['statusCode'].toInt(),
        data: json['data'],
        error: json['error'],
      );
}
