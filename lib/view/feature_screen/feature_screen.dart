import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/constants/color_constants.dart';
import 'package:recipe_app/view/bottom_navi/bottom_navi.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  final List carousalComponents = [
    ['assets/images/Rectangle 17 (1).png', 'Explore Recipes around the world'],
    ['assets/images/Rectangle 17.png', 'Create your Own Recipe'],
    ['assets/images/Rectangle 34.png', 'Search using Ingrediants'],
  ];
  int onChangeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarouselSlider.builder(
                itemCount: carousalComponents.length,
                itemBuilder: (context, index, realIndex) => FittedBox(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 357,
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(carousalComponents[index][0]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(120, 0, 0, 0),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                carousalComponents[index][1],
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 50 / 49,
                  onPageChanged: (index, reason) {
                    onChangeIndex = index;
                    setState(() {});
                  },
                )),
            SmoothIndicator(
              offset: onChangeIndex.toDouble(),
              count: carousalComponents.length,
              size: Size.fromRadius(34),
              effect: ExpandingDotsEffect(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNaviBar(),
                      ));
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(120, 0, 0, 0),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.abc,
                          color: Colors.transparent,
                          size: 46,
                        ),
                        Text(
                          "Explore",
                          style: TextStyle(
                            fontFamily: Constants.mainFont,
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 38,
                            ))
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
