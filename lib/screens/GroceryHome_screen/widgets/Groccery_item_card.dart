import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_images.dart';

class GrocceryItemCard extends StatelessWidget {
  final String itemImage;
  final int itemPrice;
  final String itemDes;
  final Function addtoCart;

  const GrocceryItemCard(
      {super.key,
      required this.itemImage,
      required this.itemPrice,
      required this.itemDes,
      required this.addtoCart});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 195,
        width: 170,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Appcolors.black_10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                itemImage,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                ' \$$itemPrice',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    height: 2.0,
                    color: Appcolors.black_90),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                itemDes,
                style: TextStyle(
                    color: Appcolors.black_45,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.9),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 40,
        right: -2,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10.0),
              backgroundColor: Appcolors.darkBlue,
            ),
            onPressed: () {
              addtoCart();
            },
            child: SvgPicture.asset(
              AppImages.plusIcon,
              height: 10,
              width: 10,
            )),
      ),
    ]);
  }
}
