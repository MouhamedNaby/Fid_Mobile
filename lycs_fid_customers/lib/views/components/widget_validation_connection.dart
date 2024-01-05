// ignore_for_file: prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/controllers/client.dart';
import 'package:lycs_fid_customers/database/databasehelper.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/accueil.dart';
import 'package:lycs_fid_customers/views/components/redirection.dart';
import 'package:lycs_fid_customers/views/connection/connexion.dart';

class ValidationConnection extends StatefulWidget {
  const ValidationConnection({super.key, this.username, this.password});

  final String? username;
  final String? password;

  @override
  State<ValidationConnection> createState() => _ValidationConnectionState();
}

class _ValidationConnectionState extends State<ValidationConnection> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: null,
      ),
      child: FutureBuilder<ClientResponse?>(
        future: UserController().login(widget.username!, widget.password!),
        builder: (context, AsyncSnapshot<ClientResponse?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(pageWidth * 0.05),
              ),
              title: const Text('Connexion'),
              content: CircularProgressIndicator(
                color: Config.colors.primaryColor,
              ),
            );
            //return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            if (snapshot.data != null) {
              print(snapshot.data!.data);

              ClientResponse clientResponsee = snapshot.data!;

              if (clientResponsee.statusCode == 200) {
                print('Connexion réussie');
                print('Connection a la base de données');

                Client cli = Client.fromJson(
                    jsonDecode(clientResponsee.data!)); //snapshot.data!.data);

                DatabaseHelper.getDB();
                print('Ajout du client dans la base de données');

                DatabaseHelper.addClient(cli);

                return Accueil(
                  user: cli,
                );
              } else {
                print('Erreur lors de la connexion');
                print('StatusCode: ${clientResponsee.statusCode}');
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(pageWidth * 0.05),
                  ),
                  alignment: Alignment.center,
                  content: const Text('Email ou mot de passe incorrect!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              }
            } else {
              //showSnackBar(context, 'Erreur lors de la connexion');

              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(pageWidth * 0.05),
                ),
                alignment: Alignment.center,
                //title: const Text('Connexion'),
                content: const Text('Email ou mot de passe incorrect!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            }
          } else {
            //print('Pas de Client trouvé');
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(pageWidth * 0.05),
              ),
              alignment: Alignment.center,
              //title: const Text('Connexion'),
              content: const Text('Oups! Une erreur est survenue!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
