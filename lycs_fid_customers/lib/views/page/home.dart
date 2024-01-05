// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/controllers/article.dart';
import 'package:lycs_fid_customers/views/components/appbarfid.dart';
import 'package:lycs_fid_customers/views/components/bon_caroussel.dart';
import 'package:lycs_fid_customers/views/components/campagne_caroussel.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/components/list_prospectus.dart';
import 'package:lycs_fid_customers/views/page/liste_bon.dart';
import 'package:lycs_fid_customers/views/page/liste_campagne.dart';
import 'package:lycs_fid_customers/animation/delayed_animation.dart';
import 'package:lycs_fid_customers/views/page/liste_prospectus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.user, this.article, this.campagne, this.bon});

  final Client? user;
  final ArticleResponse? article;
  final ArticleResponse? campagne;
  final ArticleResponse? bon;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        alignment: AlignmentDirectional.topStart,
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
          SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8.0),
                  DelayedAnimation(
                    delay: 500,
                    child: buildContainer(
                      context,
                      pageWidth,
                      pageHeight * 0.23,
                      const ListeCampagne(),
                      const ArticleCaroussel(),
                      'Mes campagnes',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  DelayedAnimation(
                    delay: 1000,
                    child: buildContainer(
                      context,
                      pageWidth,
                      pageHeight * 0.18,
                      const ListAllProspectus(),
                      const ListeProspectus(),
                      'Mes prospectus',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  DelayedAnimation(
                    delay: 1500,
                    child: buildContainer(
                      context,
                      pageWidth,
                      pageHeight * 0.215,
                      const ListeBons(),
                      const BonCaroussel(),
                      'Mes bons',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  DelayedAnimation(
                    delay: 2000,
                    child: buildContainer(
                      context,
                      pageWidth,
                      pageHeight * 0.25,
                      const ListeCampagne(),
                      const Text('Last activities'),
                      'Mes activités',
                    ),
                  ),
                  SizedBox(height: pageHeight * 0.09),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext context, double boxWidth, double boxHeight,
      Widget redirect, Widget element, String title) {
    return Container(
      width: boxWidth,
      height: boxHeight,
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(180, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Premier élément (centré à gauche)
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: pageWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Deuxième élément (centré à droite)
              Expanded(
                  child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return redirect;
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Voir plus',
                      style: TextStyle(
                        color: Config.colors.primaryColor,
                        fontSize: pageWidth * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Config.colors.primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: pageWidth * 0.05,
                        color: Colors.white,
                        weight: 80,
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
          // Liste Prospectus
          element,
        ],
      ),
    );
  }
}
