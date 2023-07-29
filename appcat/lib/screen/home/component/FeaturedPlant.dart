import 'package:flutter/material.dart';
import 'package:appcat/constants.dart';

class FeaturedPlant extends StatelessWidget {
  const FeaturedPlant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturedPlantCard(
            images: "assets/images/bottom_img_1.png",
            press: () {},
          ),
          FeaturedPlantCard(
            images: "assets/images/bottom_img_2.png",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class FeaturedPlantCard extends StatelessWidget {
  const FeaturedPlantCard(
      {super.key, required this.images, required this.press});
  final Function() press;
  final String images;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(images),
          ),
        ),
      ),
    );
  }
}
