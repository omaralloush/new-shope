import 'package:flutter/material.dart';
import 'package:new_shope/data/models/category/category_model.dart';

import '../../data/models/product/product_model.dart';
// import 'package:provider/provider.dart';

class ProductScreenProvider extends ChangeNotifier {
  CategoryModel? filterBy;
}
