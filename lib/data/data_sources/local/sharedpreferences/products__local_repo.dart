import 'package:new_shope/services/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/product/product_model.dart';

class ProductsLocalRepo {
  Future<void> setProducts(List<ProductModel> products) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('ProductschachDate', DateTime.now().toString());
    prefs.setStringList(
        'cachedProducts', products.map((product) => product.toJson()).toList());
  }

  // Future<bool> thereIsCachedProducts(List<ProductModel> products) async {}

  Future<List<ProductModel>?> getCachedProducts() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('cachedProducts')
        ? prefs
            .getStringList('cachedProducts')!
            .map((jsonProduct) => ProductModel.fromJson(jsonProduct))
            .toList()
        : null;
  }

  Future<void> refreshCachedProducts() async {
    var prefs = await SharedPreferences.getInstance();
    DateTime lastCachTime = DateTime.parse(
        prefs.getString('ProductschachDate') ?? DateTime.now().toString());
    if (lastCachTime.add(const Duration(days: 2)).isAfter(DateTime.now())) {
      setProducts(await MainApi.getProducts(20, 0));
    }
  }
}
