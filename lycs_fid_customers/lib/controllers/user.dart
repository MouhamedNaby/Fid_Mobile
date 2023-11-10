import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lycs_fid_customers/model/client.dart';

class UserController with ChangeNotifier {
  Client _client = Client();

  set setClient(Client client) => _client = client;

  Client get getClient => _client;

  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://lycsfid.onrender.com/api/v1/login/'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken':
            'mo1vlwzna7fV75VvJx49AOo7QeJ1Mp6PB8GMgnBAxL9lJLc6xLGGXkqYRTqcvI8l',
      },
      body: jsonEncode(<String, String>{
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Connexion réussie');
    } else {
      print('Erreur lors de la connexion');
      print('StatusCode: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  Future<void> createAccount(Client client) async {
    final response = await http.post(
      Uri.parse('https://lycsfid.onrender.com/api/v1/clients'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRFToken':
            'mo1vlwzna7fV75VvJx49AOo7QeJ1Mp6PB8GMgnBAxL9lJLc6xLGGXkqYRTqcvI8l',
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
}
