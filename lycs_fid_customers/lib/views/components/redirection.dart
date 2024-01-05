import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/controllers/client.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/accueil.dart';

class Redirection extends StatefulWidget {
  const Redirection(
      {super.key, this.title, this.clientResponse, this.redirected});
  final String? title;
  final ClientResponse? clientResponse;
  final bool? redirected;

  @override
  State<Redirection> createState() => _RedirectionState();
}

class _RedirectionState extends State<Redirection> {
  //bool redirect;

  @override
  void initState() {
    super.initState();
    //redirect = widget.redirected;
  }

  @override
  Widget build(BuildContext context) {
    // Vérifiez si la redirectionState a déjà été effectuée
    if (widget.redirected!) {
      // Redirigez automatiquement vers une autre page
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Accueil(
                    user: Client.fromJson(
                        jsonDecode(widget.clientResponse!.data!)),
                  )));
    }
/*
    void _redirect() {
    // Marquez la redirectionState comme effectuée
    setState(() {
      redirected = true;
    });
    */

    return const Scaffold(
      body: Text("Redirection"),
    );
  }
}
