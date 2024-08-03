import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
  const CustomAppBar({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold
            // fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily
            ),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }

  @override
  Widget get child => this;
}
