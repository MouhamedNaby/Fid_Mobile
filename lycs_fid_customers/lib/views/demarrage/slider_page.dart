import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lycs_fid_customers/configs/config.dart';

class Info {
  String titre;
  String image;
  String description;

  Info(this.titre, this.image, this.description);
}

class StartCaroussel extends StatefulWidget {
  const StartCaroussel({super.key});

  @override
  State<StartCaroussel> createState() => _StartCarousselState();
}

class _StartCarousselState extends State<StartCaroussel> {
  final List<Info> info = [
    Info('Choisir partenaire', 'assets/images/ChoisirPartenair.png',
        'Bonjour et bienvenue dans lycs Fid Customers App, Choississez un partenaire parmis tant d\'autres et profitez de nos offres et promotions.'),
    Info('Acheter et gagner', 'assets/images/acheterGagner.png',
        'Achetez chez nos partenaires et gagnez des points de fidélité à chaque achat effectuez pour profiter de nos cadeaux.'),
    Info('Echanger vos points', 'assets/images/img_cadeau.png',
        'Echangez vos points contre des cadeaux et des réductions chez nos partenaires.'),
  ];

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 244, 0, 216),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: info.map((infos) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 0.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 247, 7, 255),
                      ),
                      child: Column(children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              bottom: MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: Center(
                              child: Text(
                                infos.titre,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.35,
                          margin: const EdgeInsets.only(
                            top: 2,
                            bottom: 1,
                          ),
                          child: Image.asset(infos.image, fit: BoxFit.contain),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              bottom: 0.0,
                            ),
                            child: Center(
                              child: Text(
                                infos.description,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    color: Config.colors.primaryColor),
                              ),
                            )),
                      ]),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.65,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 4000),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: info.asMap().entries.map((entry) {
                return buildIndicator(entry.key);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
