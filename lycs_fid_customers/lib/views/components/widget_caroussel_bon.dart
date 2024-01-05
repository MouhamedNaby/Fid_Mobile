import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/configs/config.dart';
import 'package:lycs_fid_customers/model/bon_de_reduction.dart';
import 'package:lycs_fid_customers/model/campagne.dart';
//import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lycs_fid_customers/views/components/image_check_url.dart';

class WidgetCarousselBon extends StatefulWidget {
  const WidgetCarousselBon({Key? key, required this.listeBons})
      : super(key: key);

  final List<BonDeReduction>? listeBons;

  @override
  State<WidgetCarousselBon> createState() => _WidgetCarousselBonState();
}

class _WidgetCarousselBonState extends State<WidgetCarousselBon> {
  List<BonDeReduction>? info = [];

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

  void initate() {
    info = widget.listeBons;
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    //print('Description de l\'image ${widget.listeBons}');
    return // Generated code for this Carousel Widget...
        SizedBox(
      width: double.infinity,
      height: pageHeight * 0.15,
      child: CarouselSlider(
        items: widget.listeBons!.map((infos) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 0.0),
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
        //carouselController: _model.carouselController ??= CarouselController(),
        options: CarouselOptions(
          initialPage: 1,
          viewportFraction: 0.5,
          disableCenter: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.25,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          //onPageChanged: (index, _) => _model.carouselCurrentIndex = index,
        ),
      ),
    );
    /*
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
            items: widget.listeBons!.map((infos) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
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
                  );
                },
              );
            }).toList(),
          ), /*
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: info!.asMap().entries.map((entry) {
              return buildIndicator(entry.key);
            }).toList(),
          ),*/
        ],
      ),
    );*/
  }
}
