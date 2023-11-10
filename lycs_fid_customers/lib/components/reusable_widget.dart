import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';

Container buildTextContainer({
  required String labelName,
  required TextEditingController labelController,
  required IconData icone,
  bool isPassword = false,
  bool passwordVisible = true,
  VoidCallback? onPress,
  IconData? isStroke = Icons.visibility,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 5),
    padding: const EdgeInsets.all(0),
    height: 43,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
    ),
    child: TextField(
      controller: labelController,
      decoration: InputDecoration(
        labelText: labelName,
        contentPadding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 50,
        ),
        prefixIcon: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(0),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Config.colors.primaryColor,
            borderRadius: BorderRadius.circular(200),
            border: Border.all(
              color: Colors.white,
              width: 0.5,
            ),
          ),
          child: Icon(
            icone,
            color: Colors.white,
            size: 25,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Config.colors.primaryColor,
            width: 10.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  onPress!();
                },
                icon: Icon(
                  isStroke,
                  color: Config.colors.primaryColor,
                ),
              )
            : null,
      ),
      obscureText: passwordVisible,
    ),
  );
}
