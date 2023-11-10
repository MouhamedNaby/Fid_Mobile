// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/accueil.dart';
import 'package:lycs_fid_customers/components/function.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/connection/connexion.dart';
import 'package:lycs_fid_customers/controllers/user.dart';
import 'package:lycs_fid_customers/delayed_animation.dart';
import 'package:lycs_fid_customers/components/reusable_widget.dart';
import 'package:lycs_fid_customers/model/client.dart';
//import 'package:lycs_fid_customers/model/client.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  String background = 'assets/svg/background.svg';
  double pageWidth = 0;
  double pageHeight = 0;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassVisiblewordController =
      TextEditingController();
  bool passVisible = true;
  bool confirmPassVisible = true;

  @override
  Widget build(BuildContext context) {
    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;

    Client client;
    UserController user = UserController();
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
                        top: pageHeight * 0.05,
                        bottom: pageHeight * 0.01,
                      ),
                      child: Text(
                        'Créer un compte',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: pageWidth * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: pageHeight * 0.005,
                        bottom: pageHeight * 0.07,
                      ),
                      width: pageWidth,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Veuillez remplir le formulaire ci-dessous !',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: pageWidth * 0.045,
                          ),
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
                                      labelName: 'Nom',
                                      labelController: _nameController,
                                      icone: Icons.person,
                                      isPassword: false,
                                      passwordVisible: false,
                                    ),
                                    buildTextContainer(
                                      labelName: 'Prénom',
                                      labelController: _firstnameController,
                                      icone: Icons.person,
                                      isPassword: false,
                                      passwordVisible: false,
                                    ),
                                    buildTextContainer(
                                      labelName: 'Téléphone',
                                      labelController: _telController,
                                      icone: Icons.phone,
                                      isPassword: false,
                                      passwordVisible: false,
                                    ),
                                    buildTextContainer(
                                      labelName: 'Email',
                                      labelController: _emailController,
                                      icone: Icons.email,
                                      isPassword: false,
                                      passwordVisible: false,
                                    ),
                                    buildTextContainer(
                                      labelName: 'Adresse',
                                      labelController: _adresseController,
                                      icone: Icons.location_on,
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
                                    buildTextContainer(
                                      labelName: 'Confirm Password',
                                      labelController:
                                          _confirmpassVisiblewordController,
                                      icone: Icons.password,
                                      isPassword: true,
                                      passwordVisible: confirmPassVisible,
                                      isStroke: confirmPassVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      onPress: () => {
                                        setState(() {
                                          confirmPassVisible =
                                              !confirmPassVisible;
                                        })
                                      },
                                    ),
                                    // Bouton de sauvegarde creation de compte
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: pageHeight * 0.02,
                                        left: pageWidth * 0.5,
                                        bottom: pageHeight * 0.02,
                                      ),
                                      child: InkWell(
                                        onTap: () => {
                                          if (_formKey.currentState!.validate())
                                            {
                                              print(
                                                  'Prénom: ${_firstnameController.text}'),
                                              print(
                                                  'Nom: ${_nameController.text}'),
                                              print(
                                                  'Téléphone: ${_telController.text}'),
                                              print(
                                                  'Adresse: ${_adresseController.text}'),
                                              print(
                                                  'Password: ${_passwordController.text}'),
                                              print(
                                                  'E-mail: ${_emailController.text}'),
                                              client = Client(
                                                lastName: _nameController.text,
                                                firstName:
                                                    _firstnameController.text,
                                                phone: _telController.text,
                                                adresse:
                                                    _adresseController.text,
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text,
                                              ),
                                              user.setClient = client,
                                              print(user.getClient),
                                              user.createAccount(
                                                  user.getClient),
                                              clear({
                                                "name": _nameController,
                                                "firstname":
                                                    _firstnameController,
                                                "tel": _telController,
                                                "adresse": _adresseController,
                                                "email": _emailController,
                                                "password": _passwordController,
                                                "confirmpassword":
                                                    _confirmpassVisiblewordController
                                              }),
                                            }
                                          else
                                            {
                                              print(
                                                  'Veuillez remplir tous les champs'),
                                            },
                                          if (_passwordController.text !=
                                              _confirmpassVisiblewordController
                                                  .text)
                                            {
                                              print(
                                                  'Les mots de passe ne correspondent pas'),
                                            }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'Créer ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
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
                        // Texte de connexion avec google
                        DelayedAnimation(
                          delay: 2000,
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Accueil(),
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
                        // Compte existante ?
                        DelayedAnimation(
                          delay: 2500,
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
                                  'Vous avez déjà un compte ?',
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
                                              const Connection(),
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Se connecter ',
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
        ],
      ),
    );
  }
}
