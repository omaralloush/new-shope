import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/providers/bottom_nav_bar__index_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final TabController pageController;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
      // Theme.of(context).primaryColor.withOpacity(0.5),
      onTap: (value) {
        pageController.animateTo(value);
        Provider.of<BottomNavBarIndexProvider>(context, listen: false)
            .changeIndex(value);
      },
      currentIndex: Provider.of<BottomNavBarIndexProvider>(context).index,
      selectedItemColor: Colors.cyanAccent,
      items: [
        _navBarItem("Home", Icons.home, context),
        _navBarItem("Products", Icons.shopping_bag_rounded, context),
        _navBarItem("Cart", Icons.shopping_cart, context),
        _navBarItem("Profile", Icons.person, context),
      ],
    );
  }

  BottomNavigationBarItem _navBarItem(
      String title, IconData icon, BuildContext context) {
    return BottomNavigationBarItem(
      label: title,
      icon: Icon(
        icon,
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }
}
