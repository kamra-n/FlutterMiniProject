import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/constant/app_colors.dart';
import 'package:miniproject/constant/app_images.dart';
import 'package:miniproject/screens/GroceryHome_screen/Groccery_home_screen.dart';
import 'package:miniproject/screens/category_screen/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const GrocerryHomeScreen(),
    const Category_screen(),
    Text(
      'Index 2: School 2',
    ),
    Text(
      'Index 3: Schooling',
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.homeIcon,
                height: 20,
                width: 20,
              ),
              label: 'Home',
              backgroundColor: Appcolors.black_10),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.categoryIcon,
                height: 20,
                width: 20,
              ),
              label: 'Category',
              backgroundColor: Appcolors.black_10),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.favIcon,
                height: 20,
                width: 20,
              ),
              label: 'Favourite',
              backgroundColor: Appcolors.black_10),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.moreIcon,
                height: 20,
                width: 20,
              ),
              label: 'More',
              backgroundColor: Appcolors.black_10),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Appcolors.black_90,
        onTap: onItemTapped,
      ),
    );
  }
}
