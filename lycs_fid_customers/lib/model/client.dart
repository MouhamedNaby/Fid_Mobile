import 'package:flutter/material.dart';

class Client with ChangeNotifier {
  String? id;
  String? lastName;
  String? firstName;
  String? email;
  String? adresse;
  String? password;
  String? phone;

  Client(
      {this.id,
      this.lastName,
      this.firstName,
      this.email,
      this.adresse,
      this.password,
      this.phone});

  set setId(String? id) => () {
        this.id = id;
        notifyListeners();
      };

  String get getId => id!;
  set setLastName(String? lastName) => () {
        this.lastName = lastName;
        notifyListeners();
      };
  String get getLastName => lastName!;
  set setFirstName(String? firstName) => () {
        this.firstName = firstName;
        notifyListeners();
      };
  String get getFirstName => firstName!;
  set setEmail(String? email) => () {
        this.email = email;
        notifyListeners();
      };
  String get getEmail => email!;
  set setAdresse(String? adresse) => () {
        this.adresse = adresse;
        notifyListeners();
      };
  String get getAdresse => adresse!;
  set setPassword(String? password) => () {
        this.password = password;
        notifyListeners();
      };
  String get getPassword => password!;
  set setPhone(String? phone) => () {
        this.phone = phone;
        notifyListeners();
      };
  String get getPhone => phone!;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
      id: json['id'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      email: json['email'],
      adresse: json['adresse'],
      password: json['password'],
      phone: json['phone']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'email': email,
        'adresse': adresse,
        'password': password,
        'phone': phone
      };
}
