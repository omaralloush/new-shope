// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_shope/data/models/product/product_model.dart';

import 'custom_slide.dart';

class CustomSlider extends StatelessWidget {
  final List<ProductModel> items;
  final Size size;
  const CustomSlider({
    super.key,
    required this.items,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items
            .map((product) => CustomSlide(item: product, size: size))
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1100),
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          viewportFraction: 0.9,
          aspectRatio: 2,
        ));
  }
}
