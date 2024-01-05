// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/controllers/article.dart';
import 'package:lycs_fid_customers/model/article.dart';
import 'package:lycs_fid_customers/model/campagne.dart';
import 'package:lycs_fid_customers/views/components/widget_caroussel_campagne.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ArticleCaroussel extends StatefulWidget {
  const ArticleCaroussel({super.key, this.article});

  final ArticleResponse? article;

  @override
  State<ArticleCaroussel> createState() => _ArticleCarousselState();
}

class _ArticleCarousselState extends State<ArticleCaroussel> {
  List<Campagne> info = [];
  ArticleResponse? article;

  void initate() {
    article = widget.article;
  }

  int _currentIndex = 0;

  Widget buildIndicator(int index) {
    return Container(
      //width: isActive ? 12.0 : 8.0,
      width: 30,
      height: 6.0,
      margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: index == _currentIndex ? Colors.blue : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticleResponse?>(
      future: ArticleController().getAllCampagnes(),
      builder: (context, AsyncSnapshot<ArticleResponse?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
            print(snapshot.data!.data);
            List<Campagne> campagnes =
                ArticleController().listCampagnes(snapshot.data!);

            if (campagnes.length != 0) {
              print('nombre de campagnes : ${campagnes.length}');
              return WidgetCarousselCampagne(listeCampagnes: campagnes);
              //return carousselCapgneWidget(context, campagnes);
            } else {
              return Container(
                child: const Text('Pas de campagne'),
              );
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

  // widget carousell campagne
  Widget carousselCapgneWidget(
      BuildContext context, List<Campagne> listeCampagnes) {
    //print('Description de l\'image ${widget.listeCampagnes}');
    return Center(
      child: Column(
        children: [
          ExpandableCarousel(
            options: CarouselOptions(
              //height: MediaQuery.of(context).size.height * 0.2,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 4000),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: listeCampagnes.map((infos) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 0.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 247, 0, 255),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(children: [
                        InkWell(
                          onTap: () {
                            print('tap');
                          },
                          child: Image.network(
                            infos.image!,
                            fit: BoxFit.cover,
                            semanticLabel: '',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                        ), /*
                      Text(
                        infos.getDescription,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                      ]),
                    ),
                  );
                },
              );
            }).toList(),
          ), /*
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: info!.asMap().entries.map((entry) {
              return buildIndicator(entry.key);
            }).toList(),
          ),*/
        ],
      ),
    );
  }
}
