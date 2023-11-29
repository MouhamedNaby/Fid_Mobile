// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/controllers/article.dart';
import 'package:lycs_fid_customers/views/components/reusable_widget.dart';
import 'package:lycs_fid_customers/model/article.dart';

class ListeProspectus extends StatefulWidget {
  const ListeProspectus({super.key, this.articles});

  final List<Article>? articles;

  @override
  State<ListeProspectus> createState() => _ListeProspectusState();
}

class _ListeProspectusState extends State<ListeProspectus> {
  String background = 'assets/svg/bg_accueil.svg';
  double pageWidth = 0;
  double pageHeight = 0;

  List<Article>? articles;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;
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
            articles = ArticleController().listArticles(snapshot.data!);

            List<Article> limitedList = articles!.take(4).toList();
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
                children: limitedList.map((team) {
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
            child: const Text('Une erreur inattendue s\'est produite!'),
          );
        }
      },
    );
  }
}
