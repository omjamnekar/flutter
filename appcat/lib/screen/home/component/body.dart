import 'dart:ui';

import 'package:appcat/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appcat/screen/home/component/header_with_searchbox.dart';
import 'package:appcat/screen/home/component/title_with_more_btn.dart';
import 'package:appcat/screen/home/component/recomend_plants.dart';
import 'package:appcat/screen/home/component/FeaturedPlant.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // it will provids us total height and width of our screen
    Size size = MediaQuery.of(context).size;

    // it enable scrolling on small devices
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          HeaderWIthSearchBox(size: size),
          TitleWithMoreBtn(
            press: () {},
            title: "Recomended",
          ),
          Recomended_plants(),
          TitleWithMoreBtn(
            press: () {},
            title: "Featured Plants",
          ),
          FeaturedPlant(),
        ],
      ),
    );
  }
}
