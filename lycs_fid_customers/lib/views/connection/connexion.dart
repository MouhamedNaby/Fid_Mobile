// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/views/accueil.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/controllers/user.dart';
import 'package:lycs_fid_customers/model/client.dart';
import 'package:lycs_fid_customers/views/components/function.dart';
import 'package:lycs_fid_customers/views/components/widget_validation_connection.dart';
import 'package:lycs_fid_customers/views/demarrage/welcome.dart';
//import 'package:provider/provider.dart';
import 'package:lycs_fid_customers/animation/delayed_animation.dart';
import 'package:lycs_fid_customers/views/components/reusable_widget.dart';
import 'package:lycs_fid_customers/views/connection/inscription.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:lycs_fid_customers/model/client.dart';

class Connection extends StatefulWidget {
  const Connection({super.key});

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  String background = 'assets/svg/background.svg';
  double pageWidth = 0;
  double pageHeight = 0;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passVisible = true;
  bool _showWidget = false;
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;
    //Client client = Client();
    return Scaffold(
      body: Stack(
        children: [
          // Background SVG Image
          Positioned.fill(
            child: SvgPicture.asset(
              background,
              semanticsLabel: 'Background',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: pageWidth,
            height: pageHeight,
            margin: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: pageWidth * 0.05,
            ),
            child: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: pageHeight * 0.07,
                        bottom: pageHeight * 0.12,
                      ),
                      child: Text(
                        'Se connecter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: pageWidth * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        DelayedAnimation(
                          delay: 1500,
                          child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    buildTextContainer(
                                      labelName: 'Email',
                                      labelController: _emailController,
                                      icone: Icons.email,
                                      isPassword: false,
                                      passwordVisible: false,
                                    ),
                                    buildTextContainer(
                                      labelName: 'Password',
                                      labelController: _passwordController,
                                      icone: Icons.password,
                                      isPassword: true,
                                      passwordVisible: passVisible,
                                      isStroke: passVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      onPress: () => {
                                        setState(() {
                                          passVisible = !passVisible;
                                        })
                                      },
                                    ),
                                    // Bouton de sauvegarde creation de compte
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: pageHeight * 0.02,
                                        left: pageWidth * 0.4,
                                        bottom: pageHeight * 0.02,
                                      ),
                                      child: InkWell(
                                        onTap: () async => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print(
                                                  'show widget = $_showWidget'),
                                              setState(() {
                                                _showWidget = true;
                                              }),
                                              print(
                                                  'show widget = $_showWidget'),
                                            }
                                          else
                                            {
                                              print(
                                                  'Veuillez remplir tous les champs'),
                                            }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'Se connecter ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: pageWidth * 0.05,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5),
                                              decoration: BoxDecoration(
                                                color:
                                                    Config.colors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: const Icon(
                                                Icons.arrow_forward,
                                                color: Colors.black,
                                                weight: 80,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        // Connection avec google
                        DelayedAnimation(
                          delay: 2500,
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Connection(),
                                  ))
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: const EdgeInsets.all(1),
                              backgroundColor: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/google_icon_triangle.svg',
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  ' Se connecter avec google ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: pageWidth * 0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Redirection pau cas ou le compte n'existe pas
                        DelayedAnimation(
                          delay: 3000,
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              top: pageHeight * 0.008,
                            ),
                            child: Column(
                              children: [
                                Divider(
                                  color: Config.colors.primaryColor,
                                  thickness: 1,
                                  indent: pageWidth * 0.2,
                                  endIndent: pageWidth * 0.2,
                                ),
                                Text(
                                  'Vous n\'avez pas de compte ?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: pageWidth * 0.06),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: pageHeight * 0.008,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white,
                                  ),
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Inscription(),
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Créer un compte ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: pageWidth * 0.055,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          decoration: BoxDecoration(
                                            color: Config.colors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black,
                                            weight: 80,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])),
            ),
          ),

          _showWidget
              ? Positioned.fill(
                  child: ValidationConnection(
                      username: _emailController.text,
                      password: _passwordController.text),
                )
              : const SizedBox.shrink(),
          //Positioned.fill(child: Text('')),
        ],
      ),
    );
  }
}
