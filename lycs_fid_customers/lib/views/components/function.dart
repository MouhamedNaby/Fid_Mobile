import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/controllers/client.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/accueil.dart';
import 'package:lycs_fid_customers/views/connection/connexion.dart';

// Redirection validation de connexion et redirection
void redirectionValidationInscription(BuildContext context, Client client) {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ClientResponse?>(
      future: UserController().createAccount(client),
      builder: (context, AsyncSnapshot<ClientResponse?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
            print(snapshot.data!.data);

            ClientResponse clientResponse = snapshot.data!;

            if (clientResponse.statusCode == 200) {
              print('Connexion réussie');
              print('Status Code : ${clientResponse.statusCode}');
              print('Response: ${clientResponse.data}');
              // Redirection vers la page d'accueil
              Navigator.pushNamed(context, '/home');
            } else {
              print('Erreur lors de la connexion');
              print('StatusCode: ${clientResponse.statusCode}');
              print('Response: ${clientResponse.data}');
              // Afficher un message d'erreur
              //showSnackBar(context, 'Erreur lors de la connexion');
            }
            return Connection();
          } else {
            showSnackBar(context, 'Erreur lors de la connexion');
            return Container(
              child: const Text('Pas de campagne'),
            );
          }
        } else {
          print('Pas de Client trouvé');
          return Container(
            child: const Text('Une erreur inattendue s\'est produite!'),
          );
        }
      },
    );
  }
}

void redirectionValidationConnexion(
    BuildContext context, String username, String password) {
  print('username: $username');
  print('password: $password');
  FutureBuilder<ClientResponse?>(
    future: UserController().login(username, password),
    builder: (context, AsyncSnapshot<ClientResponse?> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      } else if (snapshot.hasData) {
        if (snapshot.data != null) {
          print(snapshot.data!.data);

          ClientResponse clientResponse = snapshot.data!;

          if (clientResponse.statusCode == 200) {
            print('Connexion réussie');
            print('Status Code : ${clientResponse.statusCode}');
            print('Response: ${clientResponse.data}');
            // Redirection vers la page d'accueil
            return Accueil(
                user: Client.fromJson(jsonDecode(clientResponse.data!)));
          } else {
            print('Erreur lors de la connexion');
            print('StatusCode: ${clientResponse.statusCode}');
            print('Response: ${clientResponse.data}');
            print('username: $username');
            print('password: $password');
            // Afficher un message d'erreur
            showSnackBar(context, 'Erreur lors de la connexion');
          }
          return Connection();
        } else {
          showSnackBar(context, 'Erreur lors de la connexion');
          return Container(
            child: const Text('Pas de campagne'),
          );
        }
      } else {
        print('Pas de Client trouvé');
        return Container(
          child: const Text('Une erreur inattendue s\'est produite!'),
        );
      }
    },
  );
}

// Afficher les conditions de confidentialité
void afficherConditionConfidentialite(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Condition de confidentialité'),
            const SizedBox(height: 16.0),
            const Text('Contenue de la condition de confidentialité...'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        ),
      );
    },
  );
}

void clear(Map<String, TextEditingController> controllers) {
  controllers.forEach((key, value) {
    value.clear();
  });
}

void clearFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ),
  );
}

void showAlertDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Fermer'),
          ),
        ],
      );
    },
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context).pop();
}

void showBottomSheet(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

void showBottomSheetDialog(BuildContext context, Widget widget) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

void showBottomSheetDialogWithDismiss(BuildContext context, Widget widget) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: widget,
      );
    },
  );
}
