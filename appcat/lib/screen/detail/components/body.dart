import 'package:appcat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appcat/screen/detail/components/imageAndIcon.dart';
import 'package:appcat/screen/detail/components/TitleAndPrice.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcon(size: size),
          const TitleAndPrice(
              country: "Russia\n", price: 440, title: 'Angelica'),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20)),
                      ),
                    ),
                  ),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "decription",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
