// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../core/helpers/screen_size_calc.dart';

class CustomCard extends StatelessWidget {
  final void Function()? onTap;
  final String coverImage;
  final String text;
  const CustomCard({
    super.key,
    required this.onTap,
    required this.coverImage,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              coverImage,
              fit: BoxFit.cover,
              height: ScreenSizeCalc.getHeightByRatio(context, 0.15),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        // height: ,
      ),
    );
  }
}
