import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/model/client.dart';

class SliderView extends StatelessWidget {
  final Function(String)? onItemClick;
  final Client client;
  final bool? isSliderOpen;

  const SliderView(
      {Key? key, this.onItemClick, required this.client, this.isSliderOpen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Row(
              children: <Widget>[
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.network(
                            'https://lycsfid.onrender.com/media/aft1_7EDUl1d.jpg')
                        .image,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${client.getFirstName} ${client.getLastName}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'BalsamiqSans_Regular'),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      client.getPhone,
                      style: TextStyle(
                          color: Config.colors.primaryColor,
                          fontSize: 14,
                          fontFamily: 'BalsamiqSans_Regular'),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              margin:
                  const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 1,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: const Column(
                children: <Widget>[
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text('Confidentialité'),
                  ),
                  Divider(
                    height: 0.3,
                    indent: 50,
                    endIndent: 2,
                  ),
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text('Confidentialité'),
                  ),
                  Divider(
                    height: 0.3,
                    indent: 50,
                    endIndent: 2,
                  ),
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text('Confidentialité'),
                  ),
                ],
              )),
          Container(
              margin:
                  const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 1,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: const Column(
                children: <Widget>[
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text('Confidentialité'),
                  ),
                  Divider(
                    height: 0.3,
                    indent: 50,
                    endIndent: 2,
                  ),
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text('Confidentialité'),
                  ),
                  Divider(
                    height: 0.3,
                    indent: 50,
                    endIndent: 2,
                  ),
                  ListTile(
                    leading: FlutterLogo(),
                    title: Text('Confidentialité'),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem({Key? key, required this.iconData, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("test",
            style: const TextStyle(
                color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
        leading: Icon(iconData, color: Colors.black),
        onTap: () => onTap?.call("test"));
  }
}
