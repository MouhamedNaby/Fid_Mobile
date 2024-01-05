// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/controllers/article.dart';
import 'package:lycs_fid_customers/views/components/appbarfid.dart';
import 'package:lycs_fid_customers/views/components/bon_caroussel.dart';
import 'package:lycs_fid_customers/views/components/campagne_caroussel.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/model/article.dart';
import 'package:lycs_fid_customers/model/campagne.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/components/list_prospectus.dart';

class FavorisPage extends StatefulWidget {
  const FavorisPage(
      {super.key, this.user, this.article, this.campagne, this.bon});

  final Client? user;
  final ArticleResponse? article;
  final ArticleResponse? campagne;
  final ArticleResponse? bon;

  @override
  State<FavorisPage> createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
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
      body: Stack(
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
                  Text(
                      'Bienvenue ${user.firstName} ${user.lastName} dans votre page favoris'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
