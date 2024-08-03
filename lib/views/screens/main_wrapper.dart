import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_shope/views/screens/profile_screen.dart';
import 'package:new_shope/views/screens/authentication/login_screen.dart';
import 'package:new_shope/views/screens/authentication/register_screen.dart';
import 'package:new_shope/views/screens/cart_screen.dart';
import 'package:new_shope/views/screens/home_screen.dart';
import 'package:new_shope/views/screens/products_screen.dart';
import 'package:new_shope/views/widgets/custom_app_bar.dart';
import 'package:new_shope/views/widgets/nav_bar_botton.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../services/providers/bottom_nav_bar__index_provider.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainWrapper();
}

class _MainWrapper extends State<MainWrapper> with TickerProviderStateMixin {
  // PersistentTabController homeScreenGridViewController =
  //     PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    TabController pageController = TabController(length: 4, vsync: this);
    return ChangeNotifierProvider<BottomNavBarIndexProvider>(
      create: (context) => BottomNavBarIndexProvider(),
      child: Scaffold(
          appBar: const CustomAppBar(
            title: "New Shope",
          ),
          bottomNavigationBar:
              CustomBottomNavBar(pageController: pageController),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              controller: pageController,
              children: [
                const HomeScreen(),
                ProductsScreen(),
                const CartScreen(),
                const ProfileScreen(),
              ],
            ),
          )),
    );
  }
}


  // List<Widget> _buildScreens() {
  //   return [
  //     HomeScreen(
  //       controller: pageController,
  //     ),
  //     ProductsScreen(),
  //     CartScreen(),
  //     ProfileScreen(),
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  //   return [
  //     NavBarBotton.build(context, 'Home', Icons.home),
  //     NavBarBotton.build(context, 'Products', Icons.shopping_bag_rounded),
  //     NavBarBotton.build(context, 'title3', Icons.shopping_cart),
  //     NavBarBotton.build(context, 'title3', Icons.person),
  //   ];
  // }


//  PersistentTabView(
//           context,
//           controller: homeScreenGridViewController,
//           screens: _buildScreens(),
//           items: _navBarsItems(context),
//           padding: const EdgeInsets.only(top: 8),
//           backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,

//           // backgroundColor: Theme.of(context).primaryColor,
//           isVisible: true,
//           animationSettings: const NavBarAnimationSettings(
//             navBarItemAnimation: ItemAnimationSettings(
//               // Navigation Bar's items animation properties.
//               duration: Duration(milliseconds: 500),
//               curve: Curves.ease,
//             ),
//             screenTransitionAnimation: ScreenTransitionAnimationSettings(
//               // Screen transition animation on change of selected tab.
//               animateTabTransition: true,
//               duration: Duration(milliseconds: 1000),
//               screenTransitionAnimationType:
//                   ScreenTransitionAnimationType.slide,
//             ),
//           ),
//           navBarHeight: kBottomNavigationBarHeight,
//           navBarStyle:
//               NavBarStyle.style7, // Choose the nav bar style with this property
//         )