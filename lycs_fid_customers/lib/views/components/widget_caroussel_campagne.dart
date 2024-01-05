import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/model/campagne.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:lycs_fid_customers/views/components/image_check_url.dart';

class WidgetCarousselCampagne extends StatefulWidget {
  const WidgetCarousselCampagne({Key? key, required this.listeCampagnes})
      : super(key: key);

  final List<Campagne>? listeCampagnes;

  @override
  State<WidgetCarousselCampagne> createState() =>
      _WidgetCarousselCampagneState();
}

class _WidgetCarousselCampagneState extends State<WidgetCarousselCampagne> {
  List<Campagne>? info = [];

  int _currentIndex = 0;

  Widget buildIndicator(int index) {
    return Container(
      //width: isActive ? 12.0 : 8.0,
      width: 30,
      height: 6.0,
      margin: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: index == _currentIndex ? Colors.blue : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print('Description de l\'image ${widget.listeCampagnes}');
    return Center(
      child: Column(
        children: [
          ExpandableCarousel(
            options: CarouselOptions(
              //height: MediaQuery.of(context).size.height * 0.2,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 4000),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.listeCampagnes!.map((infos) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 5.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      border: Border.all(
                        color: Config.colors.primaryColor,
                        width: 0.5,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 247, 0, 255),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: InkWell(
                            onTap: () {
                              print('tap');
                            },
                            child: ImageCheck(
                              url: infos.image!,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.15,
                            )),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
