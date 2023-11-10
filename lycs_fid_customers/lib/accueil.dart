// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/connection/inscription.dart';
//import 'package:lycs_fid_customers/delayed_animation.dart';
//import 'package:lycs_fid_customers/components/reusable_widget.dart';
//import 'package:lycs_fid_customers/model/client.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  String background = 'assets/svg/bg_accueil.svg';
  double pageWidth = 0;
  double pageHeight = 0;

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Favoris',
      style: optionStyle,
    ),
    Text(
      'Aide',
      style: optionStyle,
    ),
    Text(
      'Notification',
      style: optionStyle,
    ),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Config.colors.primaryColor,
        title: const Text('Accueil'),
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
            _widgetOptions.elementAt(_selectedIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
