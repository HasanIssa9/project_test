import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stop_and_shop/Screens/FavoritesScreen/favorites.dart';
import 'package:stop_and_shop/Screens/HomeScreen/home_screen.dart';

import '../../style/colors.dart';
import 'package:stop_and_shop/Screens/UserProfile/user_profile.dart';

import '../Cart/Cart.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);


  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  int selectItem = 0;
  List<Widget> allPages = [
    HomePage(),
    Cart(),
    Favorites(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: allPages[selectItem],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GNav(
              backgroundColor: greenColor,
              color: whiteColor,
              activeColor: blackColor,
              tabBackgroundColor: const Color.fromRGBO(0, 128, 0, 100),
              padding: const EdgeInsets.only(top: 16 , bottom: 16),
              gap: 0,
              selectedIndex: selectItem,
              onTabChange: (index) {
                selectItem = index;
                setState(() {});
              },
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: "الصفحة الرئيسية",
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  text: "سلتي",
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: "المفضلة",
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: "الملف الشخصي ",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
