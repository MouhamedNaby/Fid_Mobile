// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/views/components/appbarfid.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key, this.user});

  final Client? user;

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
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
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Config.colors.primaryColor,
        flexibleSpace: AppBarFid(
          client: user,
        ),
      ),
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
                  Container(
                    child: Column(children: [
                      const Text('Bienvenue',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black)),
                      Text('${user.firstName} ${user.lastName}',
                          style: const TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 2.0),
                            height: 200.0,
                            width: pageHeight * 0.8,
                            child: SvgPicture.asset(
                              'assets/svg/carte_fidelite.svg',
                              semanticsLabel: 'QR Code',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 250 * 0.1,
                                    margin: const EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Membre de Base',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 250 * 0.6,
                                    width: 250 * 0.6,
                                    margin: const EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: QrImageView(
                                      data:
                                          'https://docs.google.com/forms/d/1-_G2aZ3aFtFmsq2C42uQRJXrM45hc3RR2HwADlyvnKE/edit', // Remplacez par le contenu que vous souhaitez dans le QR code.
                                      version: QrVersions.auto,
                                      size: 200,
                                      gapless: true,
                                      embeddedImage: const AssetImage(
                                          'assets/images/icone_lycs.png'),
                                      embeddedImageStyle:
                                          const QrEmbeddedImageStyle(
                                        size: Size(60, 60),
                                      ),
                                      semanticsLabel:
                                          String.fromCharCode(0x1F60E),
                                      backgroundColor: const Color.fromARGB(
                                          71, 255, 255, 255),
                                    ),
                                  ),
                                  Container(
                                    height: 250 * 0.1,
                                    margin: const EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.photo_camera,
                                          size: 20,
                                        ),
                                        Text(
                                          ' Scanner',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ]),
                  ),
                  Text(
                      'Bienvenue ${user.firstName} ${user.lastName} ${user.email}'),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
