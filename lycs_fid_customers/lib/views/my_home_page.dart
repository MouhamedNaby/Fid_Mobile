import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/views/accueil.dart';
import 'package:lycs_fid_customers/controllers/user.dart';
import 'package:lycs_fid_customers/database/databasehelper.dart';
import 'package:lycs_fid_customers/views/loadpage.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/demarrage/welcome.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client client = Client();

  @override
  Widget build(BuildContext context) {
    UserController user = Provider.of<UserController>(context, listen: false);

    return FutureBuilder<List<Map<String, dynamic>>?>(
      future: DatabaseHelper.getAllClients(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadPage();
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
            //user.setClient = Client.fromJson(snapshot.data![0].toJson());
            client = Client.fromJson(snapshot.data![0]);
            user.setClient = client;
            print('Client trouvé snapshot ${client.toJson()}}');
            return Accueil(user: client);
          } else {
            return const Welcome();
          }
        } else {
          print('Pas de Client trouvé');
          return const Welcome();
        }
      },
    );
  }
}
