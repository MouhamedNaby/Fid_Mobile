// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/delayed_animation.dart';
import 'package:lycs_fid_customers/welcome.dart';

class WelcomePageContainer extends StatelessWidget {
  WelcomePageContainer({super.key, required this.background});

  String background = 'assets/svg/background.svg';
  double pageWidth = 0;
  double pageHeight = 0;

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Stack(
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
                      child: Image.asset(
                        'assets/images/demarrer.png',
                        fit: BoxFit.contain,
                      )),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            'Demarrer  ',
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            weight: 60,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Welcome(),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
