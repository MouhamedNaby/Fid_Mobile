import 'package:flutter/material.dart';

class Config {
  static final assets = _Assets();
  static final colors = _Colors();
  static void navigate(context, page, {bool replace = false}) {
    if (replace) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => page), (route) => false);
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}

class _Assets {
  final String logo = "assets/images/logoLycs.png";
}

class _Colors {
  final primaryColor = const Color(0xFFA44392);
  final secondaryColor = const Color(0xFFD8A0C8);
  final tertiaryColor = const Color(0xFF642060);
}
