import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/controllers/client.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/components/function.dart';

// Redirection validation de connexion et redirection

class ValidationConnection extends StatefulWidget {
  const ValidationConnection(
      {Key? key, required this.username, required this.password})
      : super(key: key);

  final String username;
  final String password;

  @override
  State<ValidationConnection> createState() => ValidationConnectionState();
}

class ValidationConnectionState extends State<ValidationConnection> {
  @override
  Widget build(BuildContext context) {
    String username = widget.username;
    String password = widget.password;
    return FutureBuilder<ClientResponse>(
      future: UserController().login(username, password),
      builder: (context, AsyncSnapshot<ClientResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
            print(snapshot.data!.data);
            return Container(
              child: const Text('Pas de campagne'),
            );
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
              showSnackBar(context, 'Erreur lors de la connexion');
            }
          } else {
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
