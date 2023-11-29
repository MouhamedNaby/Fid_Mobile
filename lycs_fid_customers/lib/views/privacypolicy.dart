import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditions de Confidentialité'),
      ),
      body: const Center(
        child: Text('Insérez ici le texte des conditions de confidentialité.'),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 40.0,
        color: Config.colors.primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.close,
              color: Colors.white,
              size: 20.0,
            ),
            Text(
              'Fermer',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
