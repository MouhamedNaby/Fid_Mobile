import 'dart:convert';

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

void clearFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ),
  );
}

void showAlertDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Fermer'),
          ),
        ],
      );
    },
  );
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context).pop();
}

void showBottomSheet(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

void showBottomSheetDialog(BuildContext context, Widget widget) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

void showBottomSheetDialogWithDismiss(BuildContext context, Widget widget) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: widget,
      );
    },
  );
}
