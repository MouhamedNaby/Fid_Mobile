// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/views/connection/connexion.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/animation/delayed_animation.dart';
import 'package:lycs_fid_customers/views/demarrage/slider_page.dart';
import 'package:lycs_fid_customers/views/privacypolicy.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  _WelcomeState();

  String background = 'assets/svg/background.svg';
  double pageWidth = 0;
  double pageHeight = 0;
  bool acceptPrivacyPolicy = false;
  bool isButtonEnabled = false;

  void _afficherConditionConfid(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const PrivacyPolicyPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: Colors.white),
          ),
          // Background SVG Image
          Positioned.fill(
            child: SvgPicture.asset(
              background,
              semanticsLabel: 'Background',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: pageWidth,
            height: pageHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DelayedAnimation(
                    delay: 1500,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: pageHeight * 0.7,
                      width: pageWidth,
                      margin: EdgeInsets.only(
                        top: pageHeight * 0.05,
                        bottom: pageHeight * 0.00008,
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 255, 255, 255),
                      ),
                      child: const StartCaroussel(),
                    ),
                  ),
                  DelayedAnimation(
                    delay: 2000,
                    // ignore: sized_box_for_whitespace
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: acceptPrivacyPolicy,
                          onChanged: (bool? value) {
                            setState(() {
                              acceptPrivacyPolicy = value!;
                              isButtonEnabled = value;
                            });
                          },
                        ),
                        const Text('J\'accepte les '),
                        InkWell(
                            onTap: () {
                              _afficherConditionConfid(context);
                            },
                            child: Text(
                              'Conditions de Confidentialité',
                              style: TextStyle(
                                color: Config.colors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ),
                  DelayedAnimation(
                    delay: 2500,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        left: pageWidth * 0.16,
                        right: pageWidth * 0.16,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Config.colors.primaryColor,
                            padding: const EdgeInsets.all(1)),
                        onPressed: isButtonEnabled
                            ? () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Connection(),
                                    ));
                              }
                            : null,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              'Suivant  ',
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              weight: 60,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
