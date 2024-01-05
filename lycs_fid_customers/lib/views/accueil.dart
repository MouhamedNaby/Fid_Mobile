// ignore_for_file: avoid_print

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/model/bon_de_reduction.dart';
import 'package:lycs_fid_customers/controllers/article.dart';
import 'package:lycs_fid_customers/model/article.dart';
import 'package:lycs_fid_customers/model/campagne.dart';
import 'package:lycs_fid_customers/views/slider_drawer.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lycs_fid_customers/views/page/Favoris.dart';
import 'package:lycs_fid_customers/views/page/aide.dart';
import 'package:lycs_fid_customers/views/page/home.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/page/notification.dart';

class Accueil extends StatefulWidget {
  const Accueil(
      {super.key, required this.user, this.article, this.campagne, this.bon});

  final Client user;

  final ArticleResponse? article;
  final ArticleResponse? campagne;
  final ArticleResponse? bon;

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  String background = 'assets/svg/bg_accueil.svg';
  double pageWidth = 0;
  double pageHeight = 0;

  int _selectedIndex = 0;

  ArticleResponse? article;
  ArticleResponse? campagne;
  ArticleResponse? bon;

  Client? client = Client();
  List<Article>? articles = [];
  List<Campagne>? campagnes = [];
  List<BonDeReduction>? bons = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
    client = widget.user;
    article = widget.article;
    campagne = widget.campagne;
    bon = widget.bon;
  }

  late final List<Widget> _widgetOptions = <Widget>[
    HomePage(user: client, article: article, campagne: campagne, bon: bon),
    FavorisPage(user: client, article: article, campagne: campagne, bon: bon),
    HelpPage(user: client, article: article, campagne: campagne, bon: bon),
    NotificationPage(
        user: client, article: article, campagne: campagne, bon: bon),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          /*if (_sliderDrawerKey.currentState!.isDrawerOpen) {
            _sliderDrawerKey.currentState!.closeSlider();
          }*/
        },
        child: SliderDrawer(
          appBar: SliderAppBar(
            drawerIconColor: Colors.white,
            drawerIconSize: pageWidth * 0.1,
            appBarHeight: 100,
            appBarColor: Config.colors.primaryColor,
            title: Container(
                height: pageHeight * 0.05,
                width: pageWidth * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Lycs Fid',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: pageWidth * 0.055,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial'),
                    ),
                  ],
                )),
          ),
          key: _sliderDrawerKey,
          sliderOpenSize: pageWidth * 0.85,
          slider: SliderView(
            onItemClick: (title) {
              _sliderDrawerKey.currentState!.closeSlider();
            },
            client: client!,
          ),
          child: Container(
            height: pageHeight,
            width: pageWidth,
            margin: const EdgeInsets.all(0),
            child: Stack(
              alignment: Alignment.topCenter,
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
                _widgetOptions.elementAt(_selectedIndex),

                // BottomNavigationBar
                Positioned(
                  width: pageWidth,
                  height: pageHeight * 0.07,
                  bottom: pageHeight * 0.01,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 0,
                      top: 0,
                    ),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: null,
                      border: Border.all(
                        color: Config.colors.primaryColor,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        fit: StackFit.expand,
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ).blurred(
                            blur: 10,
                            blurColor: Colors.white,
                          ),
                          BottomNavigationBar(
                            selectedFontSize: 0.0,
                            backgroundColor: Colors.white.withOpacity(0),
                            useLegacyColorScheme: false,
                            iconSize: pageWidth * 0.06,
                            items: <BottomNavigationBarItem>[
                              BottomNavigationBarItem(
                                backgroundColor: Colors.white.withOpacity(0.5),
                                icon: Column(
                                  children: [
                                    Icon(Icons.home,
                                        color: (_selectedIndex == 0)
                                            ? Config.colors.primaryColor
                                            : Colors.grey),
                                    Text('Accueil',
                                        style: TextStyle(
                                            fontSize: pageWidth * 0.028,
                                            color: (_selectedIndex == 0)
                                                ? Config.colors.primaryColor
                                                : Colors.grey))
                                  ],
                                ),
                                label: '',
                              ),
                              BottomNavigationBarItem(
                                backgroundColor: Colors.white.withOpacity(0.5),
                                icon: Column(
                                  children: [
                                    Icon(Icons.favorite,
                                        color: (_selectedIndex == 1)
                                            ? Config.colors.primaryColor
                                            : Colors.grey),
                                    Text('Favoris',
                                        style: TextStyle(
                                            fontSize: pageWidth * 0.028,
                                            color: (_selectedIndex == 1)
                                                ? Config.colors.primaryColor
                                                : Colors.grey))
                                  ],
                                ),
                                label: 'Favoris',
                              ),
                              BottomNavigationBarItem(
                                icon: Column(
                                  children: [
                                    Icon(Icons.help,
                                        color: (_selectedIndex == 2)
                                            ? Config.colors.primaryColor
                                            : Colors.grey),
                                    Text('Aide',
                                        style: TextStyle(
                                            fontSize: pageWidth * 0.028,
                                            color: (_selectedIndex == 2)
                                                ? Config.colors.primaryColor
                                                : Colors.grey))
                                  ],
                                ),
                                label: 'Aide',
                                backgroundColor: Colors.white.withOpacity(0.5),
                              ),
                              BottomNavigationBarItem(
                                icon: Column(
                                  children: [
                                    Icon(Icons.notifications,
                                        color: (_selectedIndex == 3)
                                            ? Config.colors.primaryColor
                                            : Colors.grey),
                                    Text('Notification',
                                        style: TextStyle(
                                            fontSize: pageWidth * 0.028,
                                            color: (_selectedIndex == 3)
                                                ? Config.colors.primaryColor
                                                : Colors.grey))
                                  ],
                                ),
                                label: 'Notification',
                                backgroundColor: Colors.white.withOpacity(0.5),
                              ),
                            ],
                            currentIndex: _selectedIndex,
                            elevation: 5.0,
                            onTap: _onItemTapped,
                            showSelectedLabels: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
