// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/model/bon_de_reduction.dart';
import 'package:lycs_fid_customers/controllers/article.dart';
import 'package:lycs_fid_customers/model/article.dart';
import 'package:lycs_fid_customers/model/campagne.dart';
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
    client = widget.user;
    article = widget.article;
    campagne = widget.campagne;
    bon = widget.bon;
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
          _widgetOptions.elementAt(_selectedIndex),

          // BottomNavigationBar
          Positioned(
              width: pageWidth,
              height: 100,
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            Icon(Icons.home,
                                color: (_selectedIndex == 0)
                                    ? Config.colors.primaryColor
                                    : Colors.grey),
                            Text('Home',
                                style: TextStyle(
                                    color: (_selectedIndex == 0)
                                        ? Config.colors.primaryColor
                                        : Colors.grey))
                          ],
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Icon(Icons.favorite,
                                  color: (_selectedIndex == 1)
                                      ? Config.colors.primaryColor
                                      : Colors.grey),
                              Text('Favoris',
                                  style: TextStyle(
                                      color: (_selectedIndex == 1)
                                          ? Config.colors.primaryColor
                                          : Colors.grey))
                            ],
                          ),
                          label: 'Favoris',
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Icon(Icons.help,
                                  color: (_selectedIndex == 2)
                                      ? Config.colors.primaryColor
                                      : Colors.grey),
                              Text('Aide',
                                  style: TextStyle(
                                      color: (_selectedIndex == 2)
                                          ? Config.colors.primaryColor
                                          : Colors.grey))
                            ],
                          ),
                          label: 'Aide',
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Icon(Icons.notifications,
                                  color: (_selectedIndex == 3)
                                      ? Config.colors.primaryColor
                                      : Colors.grey),
                              Text('Notification',
                                  style: TextStyle(
                                      color: (_selectedIndex == 3)
                                          ? Config.colors.primaryColor
                                          : Colors.grey))
                            ],
                          ),
                          label: 'Notification',
                          backgroundColor: Colors.white),
                    ],
                    currentIndex: _selectedIndex,
                    elevation: 5.0,
                    onTap: _onItemTapped,
                    showSelectedLabels: false,
                  ),
                ),
              ))
        ],
      ),
    )
        /*
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          // Couleur de fond de la barre
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(Icons.home,
                        color: (_selectedIndex == 0)
                            ? Config.colors.primaryColor
                            : Colors.grey),
                    Text('Home',
                        style: TextStyle(
                            color: (_selectedIndex == 0)
                                ? Config.colors.primaryColor
                                : Colors.grey))
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(Icons.favorite,
                          color: (_selectedIndex == 1)
                              ? Config.colors.primaryColor
                              : Colors.grey),
                      Text('Favoris',
                          style: TextStyle(
                              color: (_selectedIndex == 1)
                                  ? Config.colors.primaryColor
                                  : Colors.grey))
                    ],
                  ),
                  label: 'Favoris',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(Icons.help,
                          color: (_selectedIndex == 2)
                              ? Config.colors.primaryColor
                              : Colors.grey),
                      Text('Aide',
                          style: TextStyle(
                              color: (_selectedIndex == 2)
                                  ? Config.colors.primaryColor
                                  : Colors.grey))
                    ],
                  ),
                  label: 'Aide',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(Icons.notifications,
                          color: (_selectedIndex == 3)
                              ? Config.colors.primaryColor
                              : Colors.grey),
                      Text('Notification',
                          style: TextStyle(
                              color: (_selectedIndex == 3)
                                  ? Config.colors.primaryColor
                                  : Colors.grey))
                    ],
                  ),
                  label: 'Notification',
                  backgroundColor: Colors.white),
            ],
            currentIndex: _selectedIndex,
            elevation: 5.0,
            onTap: _onItemTapped,
            showSelectedLabels: false,
          ),
        ),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Inscription(),
              ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
        );
  }
}
