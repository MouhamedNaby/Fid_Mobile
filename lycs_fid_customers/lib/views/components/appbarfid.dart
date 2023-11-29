import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/model/client.dart';

class AppBarFid extends StatefulWidget {
  const AppBarFid({super.key, required this.client});

  final Client client;

  @override
  State<AppBarFid> createState() => _AppBarFidState();
}

class _AppBarFidState extends State<AppBarFid> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: Config.colors.primaryColor,
      automaticallyImplyLeading: false,
      leading: Container(
          width: pageWidth * 0.2,
          height: pageWidth * 0.2,
          child: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 40,
            ),
          )),
      title: Container(
          height: 100,
          width: pageWidth * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bonjour,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.client.getLastName} ${widget.client.getFirstName}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
      actions: [
        Container(
          width: pageWidth * 0.15,
          height: pageWidth * 0.15,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            'https://lycsfid.onrender.com/media/aft1_7EDUl1d.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ],
      centerTitle: false,
      elevation: 2,
    );
  }
}
