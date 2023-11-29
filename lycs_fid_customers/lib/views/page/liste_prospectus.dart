// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/controllers/article.dart';
import 'package:lycs_fid_customers/views/accueil.dart';
import 'package:lycs_fid_customers/views/components/appbarfid.dart';
import 'package:lycs_fid_customers/views/components/bon_caroussel.dart';
import 'package:lycs_fid_customers/views/components/campagne_caroussel.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/model/article.dart';
import 'package:lycs_fid_customers/model/campagne.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/components/list_prospectus.dart';
import 'package:lycs_fid_customers/views/components/reusable_widget.dart';

class ListeCampagne extends StatefulWidget {
  const ListeCampagne(
      {super.key, this.article, this.campagne, this.bon, this.client});

  final Client? client;
  final ArticleResponse? article;
  final ArticleResponse? campagne;
  final ArticleResponse? bon;

  @override
  State<ListeCampagne> createState() => _ListeCampagneState();
}

class _ListeCampagneState extends State<ListeCampagne> {
  String background = 'assets/svg/bg_accueil.svg';
  double pageWidth = 0;
  double pageHeight = 0;

  Client user = Client();

  List<Article>? articles;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.colors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Retour à la page précédente
            Navigator.pop(context);
          },
        ),
      ),
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
              child: Builder(builder: (BuildContext context) {
                return FutureBuilder<ArticleResponse?>(
                  future: ArticleController().getAllArticles(),
                  builder: (context, AsyncSnapshot<ArticleResponse?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      //return const CircularProgressIndicator();
                      return Center(
                        child: CircularProgressIndicator(
                          color: Config.colors.primaryColor,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        print(snapshot.data);
                        articles =
                            ArticleController().listArticles(snapshot.data!);
                        print(articles);
                        print('nombre d\'articles : ${articles!.length}');
                        // List view builder Affichage des articles

                        return GridView.count(
                            padding: const EdgeInsets.all(2),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 5,
                            controller:
                                ScrollController(keepScrollOffset: false),
                            scrollDirection: Axis.vertical,
                            primary: false,
                            children: articles!.map((team) {
                              return articleCard(team, context);
                            }).toList());
                      } else {
                        return Container(
                          child: const Text('Pas de campagne'),
                        );
                      }
                    } else {
                      print('Pas de Client trouvé');
                      return Container(
                        child: const Text(
                            'Une erreur inattendue s\'est produite!'),
                      );
                    }
                  },
                );
              }
/*
              FutureBuilder<ArticleResponse?>(
                future: ArticleController().getAllArticles(),
                builder: (context, AsyncSnapshot<ArticleResponse?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    //return const CircularProgressIndicator();
                    return Center(
                      child: CircularProgressIndicator(
                        color: Config.colors.primaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      print(snapshot.data);
                      articles =
                          ArticleController().listArticles(snapshot.data!);
                      print(articles);
                      print('nombre d\'articles : ${articles!.length}');
                      // List view builder Affichage des articles

                      return GridView.count(
                          padding: const EdgeInsets.all(2),
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 5,
                          controller: ScrollController(keepScrollOffset: false),
                          scrollDirection: Axis.vertical,
                          primary: false,
                          children: articles!.map((team) {
                            return articleCard(team, context);
                          }).toList());
                    } else {
                      return Container(
                        child: const Text('Pas de campagne'),
                      );
                    }
                  } else {
                    print('Pas de Client trouvé');
                    return Container(
                      child:
                          const Text('Une erreur inattendue s\'est produite!'),
                    );
                  }
                },
              ),
            */
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
