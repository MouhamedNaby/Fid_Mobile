import 'package:flutter/material.dart';

class Client with ChangeNotifier {
  String? id;
  String? lastName;
  String? firstName;
  String? email;
  String? adresse;
  String? password;
  String? confirmPassword;
  String? phone;
  String? age;
  String? sexe;

  Client(
      {this.id,
      this.lastName,
      this.firstName,
      this.email,
      this.adresse,
      this.password,
      this.confirmPassword,
      this.phone,
      this.age,
      this.sexe});

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
      id: json['id'].toString(),
      lastName: json['lastName'].toString(),
      firstName: json['firstName'].toString(),
      email: json['email'].toString(),
      adresse: json['adresse'].toString(),
      password: json['password'].toString(),
      confirmPassword: json['confirmPassword'].toString(),
      phone: json['phone'].toString(),
      age: json['age'].toString(),
      sexe: json['sexe'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'email': email,
        'adresse': adresse,
        'password': password,
        'confirm_password': confirmPassword,
        'phone': phone,
        'age': age,
        'sexe': sexe
      };

  void afficher() {
    print('id: $id');
    print('lastName: $lastName');
    print('firstName: $firstName');
    print('email: $email');
    print('adresse: $adresse');
    print('password: $password');
    print('confirmPassword: $confirmPassword');
    print('phone: $phone');
    print('age: $age');
    print('sexe: $sexe');
  }
}
