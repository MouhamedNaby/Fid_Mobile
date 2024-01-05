import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageCheck extends StatefulWidget {
  const ImageCheck(
      {super.key, required this.url, this.width = 0, this.height = 0});
  final String url;
  final double width;
  final double height;

  @override
  State<ImageCheck> createState() => _ImageCheckState();
}

class _ImageCheckState extends State<ImageCheck> {
  late http.Client? client;
  late http.Response? response;

  @override
  void initState() {
    super.initState();
    client = http.Client();
    response = http.Response('', 404);
    checkImage();
  }

  Future<void> checkImage() async {
    response = await client!.head(Uri.parse(widget.url));
    setState(() {});
  }

  @override
  void dispose() {
    client!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (response!.statusCode == 404) {
      // L'image retourne une erreur 404
      return Image.asset(
        'assets/images/imageError.jpg',
        fit: BoxFit.cover,
        width: widget.width,
        height: widget.height,
      );
    } else {
      // L'image est accessible
      print(widget.url);
      return Image.network(
        fit: BoxFit.cover,
        widget.url,
        width: widget.width,
        height: widget.height,
      );
    }
  }
}
