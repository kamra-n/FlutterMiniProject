import 'package:flutter/material.dart';

class GroccessorySliderCard extends StatelessWidget {
  final String headingNum;
  final String headingTxt;
  final String subHeading;
  final Color color;

  const GroccessorySliderCard(
      {super.key,
      required this.headingNum,
      required this.headingTxt,
      required this.subHeading,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 128,
      width: 158,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                headingNum.toString(),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(headingTxt,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                  ))
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            subHeading,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14.0, height: 2.0),
          )
        ],
      ),
    );
  }
}
