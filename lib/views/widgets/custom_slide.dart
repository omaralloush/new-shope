// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_shope/data/models/product/product_model.dart';

class CustomSlide extends StatelessWidget {
  final ProductModel item;
  final Size size;
  const CustomSlide({super.key, required this.item, required this.size});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.blue, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.network(
              item.thumbnail,
              // fit: BoxFit.cover,
              height: size.height * 0.9,
            ),
            Positioned(
              top: size.height * 0.9,
              left: 20,
              child: Text(
                '${item.title} ${item.price}\$',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
