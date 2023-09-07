import 'package:flutter/material.dart';
import 'package:miniproject/constant/app_colors.dart';
import 'package:miniproject/constant/app_images.dart';
import 'package:miniproject/screens/GroceryHome_screen/Groccery_home_screen.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width * 1,
      color: Appcolors.darkBlue,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: 2,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(fit: StackFit.loose, children: [
                        Text(
                          'Your holiday\nshopping\ndelivered to Screen\nOne',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30.0,
                            height: 1.3,
                            color: Appcolors.black_10,
                          ),
                        ),
                        Positioned(
                            bottom: 5,
                            right: 150,
                            child: Image.asset(AppImages.onbordingImage))
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Theres something for everyone \n to enjoy  with Sweet Shop \n Favourites Screen 1',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          height: 1.2,
                          color: Appcolors.black_1,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 60),
                        child: Row(
                          children: List.generate(
                              2,
                              (index) => Container(
                                    margin: const EdgeInsets.only(right: 7),
                                    height: 3,
                                    width: currentIndex == index ? 40 : 20,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: currentIndex == index
                                            ? Appcolors.black_10
                                            : Appcolors.black_20),
                                  )),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Image.asset(AppImages.blankAvatar),
                      ),
                    ],
                  );
                }),
          ),
          Center(
            child: InkWell(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GrocerryHomeScreen()),
                    ),
                child: Container(
                  margin: const EdgeInsets.all(40),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Appcolors.black_10,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.arrow_right_alt)
                    ],
                  )),
                )),
          )
        ],
      ),
    )));
  }
}
