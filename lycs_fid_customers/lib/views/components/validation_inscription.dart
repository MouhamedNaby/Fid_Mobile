import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/controllers/client.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/components/function.dart';

// Redirection validation de connexion et redirection

class ValidationInscription extends StatefulWidget {
  const ValidationInscription({Key? key, required this.client})
      : super(key: key);

  final Client client;

  @override
  State<ValidationInscription> createState() => ValidationInscriptionState();
}

class ValidationInscriptionState extends State<ValidationInscription> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ClientResponse>(
      future: UserController().createAccount(widget.client),
      builder: (context, AsyncSnapshot<ClientResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
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
            print(snapshot.data!.data);
            return Container(
              child: const Text('Pas de campagne'),
            );
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
