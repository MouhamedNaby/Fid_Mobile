// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:lycs_satisfaction_born/born_page.dart';

class NotificationController with ChangeNotifier {
  List<Notif> _notifications = [];

  NotificationController() {
    _notifications = [];
  }

  List<Notif> get getNotifications => _notifications;

  int get getNotificationsCount => _notifications.length;

  int get getUnreadNotificationsCount =>
      _notifications.where((element) => !element.isRead).length;

  void addNotification(Notif notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  Future<dynamic> getNotificationsFromApi(String token) async {
    final response = await http.get(
      Uri.parse('https://lycsfid.onrender.com/api/v1/notifications/'),
      headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print('Connexion réussie');
      //print('Response body ${response.body}');
      print('Status Code : ${response.statusCode}');
      _notifications = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((data) => Notif.fromJson(data))
          .toList();
      print('Liste des notifications : $_notifications');
      return _notifications;
    } else {
      print('Erreur lors de la connexion');
      print('StatusCode: ${response.statusCode}');
      print('Response: ${utf8.decode(response.bodyBytes)}');
      throw Exception(jsonDecode(response.body)['detail']);
    }
  }
}

class Notif {
  String id;
  String title;
  String body;
  bool isRead = false;

  Notif(
      {required this.id,
      required this.title,
      required this.body,
      this.isRead = false});

  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
      };

  get getId => id;
  set setId(String id) => this.id = id;
  get getTitle => title;
  set setTitle(String title) => this.title = title;
  get getBody => body;
  set setBody(String body) => this.body = body;
  get getIsRead => isRead;
  void setIsRead() => isRead = true;
}
