import 'package:flutter/material.dart';
import 'package:miniproject/constant/app_colors.dart';
import 'package:miniproject/constant/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/screens/GroceryHome_screen/widgets/Groccery_item_card.dart';
import 'package:miniproject/screens/GroceryHome_screen/widgets/Groccery_slider_card.dart';
import 'package:miniproject/constant/app_list.dart';

class GrocerryHomeScreen extends StatefulWidget {
  const GrocerryHomeScreen({super.key});

  @override
  State<GrocerryHomeScreen> createState() => _GrocerryHomeScreenState();
}

class _GrocerryHomeScreenState extends State<GrocerryHomeScreen> {
  void addToCart(item) {
    setState(() {
      Applist.cartItem.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              'Hey, Kamran',
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
                                        Applist.cartItem.length.toString(),
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
                margin: const EdgeInsets.only(top: 10),
                height: 140,
                width: MediaQuery.of(context).size.width * 1,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return GroccessorySliderCard(
                        headingNum: '\$346',
                        headingTxt: 'USD',
                        subHeading: 'Your Total Saving',
                        color: Appcolors.darkOrange);
                  },
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ]),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
              child: Text(
                'Deals on Fruits & Tea',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Appcolors.black_90),
              ),
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return GrocceryItemCard(
                  itemImage: Applist.groceryList[index]['item_image'],
                  itemPrice: Applist.groceryList[index]['item_price'],
                  itemDes: Applist.groceryList[index]['item_description'],
                  addtoCart: () => addToCart(Applist.groceryList[index]),
                );
              },
              itemCount: Applist.groceryList.length,
            ))
          ],
        ),
      ),
    );
  }
}
