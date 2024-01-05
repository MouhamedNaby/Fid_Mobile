// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/controllers/client.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/components/function.dart';
import 'package:lycs_fid_customers/views/connection/connexion.dart';

class ValidationInscription extends StatefulWidget {
  const ValidationInscription({super.key, this.client});

  final Client? client;

  @override
  State<ValidationInscription> createState() => _ValidationInscriptionState();
}

class _ValidationInscriptionState extends State<ValidationInscription> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return FutureBuilder<ClientResponse?>(
      future: UserController().createAccount(widget.client!),
      builder: (context, AsyncSnapshot<ClientResponse?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            color: Config.colors.primaryColor,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
            //print(snapshot.data!.data);

            ClientResponse clientResponse = snapshot.data!;

            if (clientResponse.statusCode == 201) {
              print('Connexion réussie');
              print('Status Code : ${clientResponse.statusCode}');
              print('Response: ${clientResponse.data}');
              // Redirection vers la page d'accueil
              return Container(
                  width: pageWidth * 0.8,
                  height: pageWidth * 0.8,
                  decoration: BoxDecoration(
                    color: null,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Bienvenue dans l’application “Lycs Fid” ${widget.client!.getFirstName} ${widget.client!.getLastName}! Votre profil a été créé avec succès. Commencez votre aventure avec Lycs Fid dès maintenant.',
                        style: TextStyle(
                          color: Config.colors.primaryColor,
                          fontSize: pageWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Config.colors.primaryColor,
                          padding: const EdgeInsets.all(1),
                          elevation: 10,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Connection(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: pageHeight * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                              'Se connecter  ',
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              weight: 60,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            } else {
              return const Text('Erreur lors de la creation de compte!');
            }
          } else {
            return Container(
              child: const Text('Erreur lors de la creation de compte!'),
            );
          }
        } else {
          return const Text('Une erreur inattendue s\'est produite!');
        }
      },
    );
  }
}
