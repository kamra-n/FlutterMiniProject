import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:miniproject/constant/app_colors.dart';
import 'package:miniproject/constant/app_images.dart';
import '../../constant/app_list.dart';
import '../cart_screen/cart_screen.dart';

class SingleProductScreen extends StatefulWidget {
  final SingleProduct;
  const SingleProductScreen({super.key, required this.SingleProduct});
  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  List imageList = [
    AppImages.appleImage,
    AppImages.orangeImage,
    AppImages.appleImage
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    void addToCart(item) {
      setState(() {
        Applist.cartItem.add(item);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: Appcolors.black_10,
                      child: SvgPicture.asset(
                        AppImages.backIcon,
                        height: 12,
                        width: 12,
                        // ignore: deprecated_member_use
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen(
                                    item: Applist.cartItem,
                                  )),
                        ),
                        child: SvgPicture.asset(
                          AppImages.bagAvatar,
                          height: 27,
                          width: 27,
                          color: Colors.black,
                        ),
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
                                    color: Appcolors.black_1, fontSize: 10.0),
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Stack(children: [
                  CarouselSlider(
                    items: widget.SingleProduct['item_image']
                        .asMap()
                        .entries
                        .map<Widget>((item) {
                      return Image.asset(
                        '${item.value}',
                        width: double.infinity,
                        fit: BoxFit.contain,
                      );
                    }).toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 2,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            widget.SingleProduct['item_image'].length,
                            (index) => Container(
                                  margin: const EdgeInsets.only(right: 7),
                                  height: 3,
                                  width: currentIndex == index ? 40 : 20,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: currentIndex == index
                                          ? Appcolors.darkOrange
                                          : Appcolors.black_20),
                                )),
                      ))
                ]),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.black_10,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, top: 20.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.SingleProduct['item_name'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Appcolors.black_90,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.SingleProduct['item_price']}',
                            style: TextStyle(
                                color: Appcolors.darkBlue,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Appcolors.darkBlue,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Text(
                              '\$22.04 OFF',
                              style: TextStyle(
                                  color: Appcolors.black_1,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Text(
                            'Reg: \$56.70 USD',
                            style: TextStyle(
                                color: Appcolors.black_20,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            color: Appcolors.black_90),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.SingleProduct['item_description'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            color: Appcolors.black_90,
                            height: 1.1),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Appcolors.black_45))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nutritional facts',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: Appcolors.black_90),
                            ),
                            SvgPicture.asset(
                              AppImages.arrowDownIcon,
                              height: 12.0,
                              width: 12.0,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        width: double.infinity,
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reviews',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  color: Appcolors.black_90),
                            ),
                            SvgPicture.asset(
                              AppImages.arrowDownIcon,
                              height: 12.0,
                              width: 12.0,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 50.0,
                            width: 140.0,
                            child: ElevatedButton(
                                onPressed: () =>
                                    addToCart(widget.SingleProduct),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolors.black_1,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Appcolors.darkBlue,
                                          width: 1.0)),
                                ),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Appcolors.darkBlue,
                                    fontSize: 14.0,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            height: 50.0,
                            width: 140.0,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolors.darkBlue,
                                  shape: const StadiumBorder(),
                                ),
                                child: Text('Buy Now',
                                    style: TextStyle(
                                      color: Appcolors.black_1,
                                      fontSize: 14.0,
                                    ))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
