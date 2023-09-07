import 'package:flutter/material.dart';
import 'package:miniproject/constant/app_colors.dart';
import 'package:miniproject/constant/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GrocerryHomeScreen extends StatelessWidget {
  const GrocerryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(color: Appcolors.ligtBlue),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20.0, top: 40.0, bottom: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Hey, Halal',
                              style: TextStyle(
                                  color: Appcolors.black_1,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Stack(
                            children: [
                              SvgPicture.asset(
                                AppImages.bagAvatar,
                                height: 22,
                                width: 22,
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Appcolors.darkOrange,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                            color: Appcolors.black_1,
                                            fontSize: 10.0),
                                      ),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Appcolors.darkBlue,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 10),
                              child: SvgPicture.asset(
                                AppImages.searchIcon,
                                height: 18,
                                width: 18,
                              ),
                            ),
                            hintStyle: TextStyle(
                                color: Appcolors.black_45,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500),
                            hintText: 'Search Products or store',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Appcolors.darkBlue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(28)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Appcolors.darkBlue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(28)),
                            )),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DELIVERY TO',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 11,
                                      color: Appcolors.black_45,
                                      letterSpacing: 0.8),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Green Way 3000, Sylhet',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Appcolors.black_10,
                                          letterSpacing: 0.8),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      AppImages.arrowDownIcon,
                                      height: 7,
                                      width: 7,
                                    )
                                  ],
                                )
                              ]),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'WITHIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 11,
                                    color: Appcolors.black_45,
                                    letterSpacing: 0.8),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '1 HOUR',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Appcolors.black_10,
                                        letterSpacing: 0.8),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SvgPicture.asset(
                                    AppImages.arrowDownIcon,
                                    height: 7,
                                    width: 7,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Stack(children: [
              Positioned(
                  left: 100,
                  top: 10,
                  child: SvgPicture.asset(AppImages.circleIcon)),
              Positioned(child: SvgPicture.asset(AppImages.halfCircle)),
              Positioned(
                  left: 170,
                  bottom: 10,
                  child: SvgPicture.asset(AppImages.smallCircleBlue)),
              Positioned(
                  right: 0,
                  bottom: 50,
                  child: SvgPicture.asset(AppImages.smallCircleYellow)),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 128,
                          width: 158,
                          decoration: BoxDecoration(
                              color: Appcolors.ligtOrange,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '346',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text('USD',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w300,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Your total savings',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    height: 2.0),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 128,
                          width: 158,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE4DDCB),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '215',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text('HRS',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w300,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Your time saveds',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    height: 2.0),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Stack(children: [
              Container(
                height: 194,
                width: 180,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Appcolors.black_10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.blankAvatar,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        '325',
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
                        'Orange Package 1\n| 1 bundle',
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
                    onPressed: () {},
                    child: SvgPicture.asset(
                      AppImages.plusIcon,
                      height: 10,
                      width: 10,
                    )),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
