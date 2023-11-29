// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/views/components/appbarfid.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Prospectus extends StatefulWidget {
  const Prospectus({super.key, this.user});

  final Client? user;

  @override
  State<Prospectus> createState() => _ProspectusState();
}

class _ProspectusState extends State<Prospectus> {
  String background = 'assets/svg/bg_accueil.svg';
  double pageWidth = 0;
  double pageHeight = 0;

  Client user = Client();

  @override
  void initState() {
    super.initState();
    user = widget.user!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: pageHeight,
        width: pageWidth,
        margin: const EdgeInsets.all(0),
        child: Stack(
          children: [
            // Background SVG Image
            Positioned.fill(
              child: SvgPicture.asset(
                background,
                semanticsLabel: 'Background',
                fit: BoxFit.fill,
              ),
            ),
            // Afficher la page selectionnée dans le bottomNavigationBar
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Afficher le QR Code
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
