import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conditions de Confidentialité',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            color: Config.colors.primaryColor,
          ),
        ),
      ),
      body: const Center(
        child: Text('Insérez ici le texte des conditions de confidentialité.'),
      ),
    );
  }
}
