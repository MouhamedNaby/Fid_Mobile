// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/model/article.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:lycs_fid_customers/model/bon_de_reduction.dart';
import 'package:lycs_fid_customers/model/campagne.dart';
import 'package:lycs_fid_customers/views/components/image_check_url.dart';

Container buildTextContainer({
  required String labelName,
  required TextEditingController labelController,
  required IconData icone,
  bool isPassword = false,
  bool passwordVisible = true,
  VoidCallback? onPress,
  IconData? isStroke = Icons.visibility,
  double? fontWidth,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 5),
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
    ),
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Veuillez saisir votre $labelName';
        }
        return null;
      },
      controller: labelController,
      decoration: InputDecoration(
        labelText: labelName,
        labelStyle: TextStyle(
          color: Colors.black45,
          fontSize: fontWidth,
        ),
        contentPadding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 50,
        ),
        prefixIcon: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Config.colors.primaryColor,
            borderRadius: BorderRadius.circular(200),
            border: Border.all(
              color: Config.colors.primaryColor,
              width: 0.4,
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

Container articleCard(Article article, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      border: Border.all(
        color: Config.colors.primaryColor,
        width: 0.5,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageCheck(
            url: 'https://lycsfid.onrender.com${article.getImage.toString()}',
            height: MediaQuery.of(context).size.height * 0.105,
            width: MediaQuery.of(context).size.height * 0.105,
          ),
        ],
      ),
    ),
  );
}

Container bonCard(BonDeReduction article, BuildContext context) {
  print(article.getImage.toString());
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      border: Border(
        bottom: BorderSide(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageCheck(
            url: article.getImage.toString(),
            height: MediaQuery.of(context).size.height * 0.109,
            width: MediaQuery.of(context).size.height * 0.109,
          ),
          Text('Reduction : ${article.getMontantDeReduction.toString()}',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    ),
  );
}

Container campagneCard(Campagne article, BuildContext context) {
  print(article.getImage.toString());
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      border: Border(
        bottom: BorderSide(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageCheck(
              url: article.getImage.toString(),
              width: MediaQuery.of(context).size.height * 0.12,
              height: MediaQuery.of(context).size.height * 0.12),
          Text(article.getDescription.toString(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    ),
  );
}

DropdownButtonFormField2 dropDownButtonField({
  List<String>? items,
  String? selectedValue,
  String? text,
  IconData? icone,
  double? fontWidth,
  /*
    required VoidCallback onChange(values, selectedValue),
    required VoidCallback onSave(values, selectedValue)*/
}) {
  return DropdownButtonFormField2<String>(
    isExpanded: false,
    decoration: InputDecoration(
      constraints: const BoxConstraints(maxHeight: 45),
      contentPadding: const EdgeInsets.symmetric(vertical: 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      prefix: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(0),
        width: 44,
        height: 44,
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
    ),
    hint: Text(
      'Selectionner votre $text',
      style: TextStyle(
        fontSize: fontWidth,
      ),
    ),
    items: items!
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return 'Veuillez selectionner votre $text';
      }
      return null;
    },
    onChanged: (value) {
      selectedValue = value;
      //onChange(selectedValue, selectedValue);
    },
    onSaved: (value) {
      selectedValue = value;
      //onChange(selectedValue, selectedValue);
    },
    buttonStyleData: const ButtonStyleData(
      padding: EdgeInsets.only(right: 8),
    ),
    iconStyleData: const IconStyleData(
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 24,
    ),
    dropdownStyleData: DropdownStyleData(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    menuItemStyleData: const MenuItemStyleData(
      padding: EdgeInsets.symmetric(horizontal: 5),
    ),
  );
}

Container dropDownButton(
    List<String> items, String selectedValue, IconData? icone) {
  return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
          DropdownButtonFormField2<String>(
            isExpanded: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              // Add more decoration..
            ),
            hint: Text(
              'Selectionner votre $selectedValue',
              style: const TextStyle(fontSize: 14),
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Veuillez selectionner votre $selectedValue';
              }
              return null;
            },
            onChanged: (value) {
              //Do something when selected item is changed.
            },
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
          )
        ],
      ));
}
