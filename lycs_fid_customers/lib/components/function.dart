import 'package:flutter/material.dart';

// Afficher les conditions de confidentialité
void afficherConditionConfidentialite(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Condition de confidentialité'),
            const SizedBox(height: 16.0),
            const Text('Contenue de la condition de confidentialité...'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        ),
      );
    },
  );
}

void clear(Map<String, TextEditingController> controllers) {
  controllers.forEach((key, value) {
    value.clear();
  });
}
