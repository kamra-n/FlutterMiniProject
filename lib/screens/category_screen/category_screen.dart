import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniproject/constant/app_list.dart';
import 'package:miniproject/screens/singleProductScreen/singleProductScreen.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_images.dart';

// ignore: camel_case_types
class Category_screen extends StatefulWidget {
  const Category_screen({super.key});

  @override
  State<Category_screen> createState() => _Category_screenState();
}

// ignore: camel_case_types
class _Category_screenState extends State<Category_screen> {
  List<Map<String, dynamic>> filterData = [];

  @override
  Widget build(BuildContext context) {
    // unique category names
    List<Map<String, dynamic>> uniqueCategoryName = [];

    Set<String> itemCategoryNamesSet = {};
    for (var item in Applist.groceryList) {
      var itemName = item["item_category"];
      if (!itemCategoryNamesSet.contains(itemName)) {
        uniqueCategoryName.add(item);
        itemCategoryNamesSet.add(itemName);
      }
    }

    // get data behalf of category

    void getDataBehalfOfCategory(String? name) {
      setState(() {
        filterData = Applist.groceryList
            .where((item) => item["item_category"] == name)
            .toList();
      });
    }

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(color: Appcolors.ligtBlue),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    SvgPicture.asset(
                      AppImages.searchIcon,
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(
                      width: 20,
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
                                      color: Appcolors.black_1, fontSize: 10.0),
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Shop',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w300,
                      color: Appcolors.black_1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('By Category',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Appcolors.black_1)),
              ),
            ])),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 80,
          width: MediaQuery.of(context).size.width * 1,
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    getDataBehalfOfCategory(
                        uniqueCategoryName[index]['item_category']);
                  },
                  child: Chip(
                    labelPadding: const EdgeInsets.all(2.0),
                    label: Text(
                      uniqueCategoryName[index]['item_category'].toString(),
                      style: TextStyle(
                        color: Appcolors.black_90,
                      ),
                    ),
                    backgroundColor: filterData.isNotEmpty &&
                            filterData[0]['item_category'] ==
                                uniqueCategoryName[index]['item_category']
                        ? Appcolors.darkOrange
                        : Appcolors.black_1,
                    elevation: 6.0,
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
              );
            },
            itemCount: uniqueCategoryName.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Expanded(
            child: filterData.isEmpty
                ? ListView.builder(
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SingleProductScreen(
                                                SingleProduct: Applist
                                                    .groceryList[index])),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? Appcolors.ligtOrange
                                          : const Color(0xFFFFC3BB),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Image.asset(
                                    Applist.groceryList[index]['item_image'][0],
                                    height: double.infinity,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                child: Column(
                                  children: [
                                    Text(
                                      Applist.groceryList[index]['item_name'],
                                      style: TextStyle(
                                          color: Appcolors.black_90,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          height: 2),
                                    ),
                                    Text(
                                        Applist.groceryList[index]
                                            ['item_description'],
                                        style: TextStyle(
                                            color: Appcolors.black_45,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            height: 2)),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text('Starting from',
                                        style: TextStyle(
                                            color: Appcolors.black_90,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w700,
                                            height: 2)),
                                    Text(
                                        Applist.groceryList[index]['item_price']
                                            .toString(),
                                        style: TextStyle(
                                            color: Appcolors.black_90,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700,
                                            height: 2))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: Applist.groceryList.length,
                  )
                : ListView.builder(
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SingleProductScreen(
                                                SingleProduct:
                                                    filterData[index])),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? Appcolors.ligtOrange
                                          : const Color(0xFFFFC3BB),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Image.asset(
                                    filterData[index]['item_image'][0],
                                    height: double.infinity,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                child: Column(
                                  children: [
                                    Text(
                                      filterData[index]['item_name'],
                                      style: TextStyle(
                                          color: Appcolors.black_90,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          height: 2),
                                    ),
                                    Text(filterData[index]['item_description'],
                                        style: TextStyle(
                                            color: Appcolors.black_45,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            height: 2)),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text('Starting from',
                                        style: TextStyle(
                                            color: Appcolors.black_90,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w700,
                                            height: 2)),
                                    Text(
                                        filterData[index]['item_price']
                                            .toString(),
                                        style: TextStyle(
                                            color: Appcolors.black_90,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700,
                                            height: 2))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: filterData.length,
                  ))
      ],
    )));
  }
}
