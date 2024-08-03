import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../core/helpers/screen_size_calc.dart';
import '../../data/models/product/product_model.dart';
import '../../services/api/api.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_slider.dart';

class HomeScreen extends StatefulWidget {
  final PersistentTabController? controller;
  const HomeScreen({this.controller, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductModel>> homeSliderProducts;
  int numOfSlides = 5;
  @override
  void initState() {
    homeSliderProducts = MainApi.getProducts(numOfSlides, 0);
    super.initState();
  }

  void onCardTap() {
    if (widget.controller != null) {
      widget.controller!.jumpToTab(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MainApi.getProducts(numOfSlides, 0),
        builder: (context, products) {
          return products.hasData
              ? Column(children: [
                  Expanded(
                    flex: 3,
                    child: CustomSlider(
                      items: products.data!,
                      size: Size.fromHeight(
                          ScreenSizeCalc.getHeightByRatio(context, 0.2)),
                    ),
                  ),
                  Divider(
                    color: Colors.blue[300],
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                  ),
                  const Text('Bowse Our Categories'),
                  Divider(
                    color: Colors.blue[300],
                    thickness: 2,
                    indent: 70,
                    endIndent: 70,
                  ),
                  Expanded(
                    flex: 7,
                    child: FutureBuilder(
                        future: MainApi.getcategories(),
                        builder: (context, categories) {
                          return categories.hasData
                              ? GridView(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  padding: const EdgeInsets.all(10),
                                  children: categories.data!
                                      .map((category) => FutureBuilder(
                                          future: MainApi.getProductsByCategory(
                                              category, 1, 0),
                                          builder: (context, product) =>
                                              product.hasData
                                                  ? CustomCard(
                                                      coverImage: product.data!
                                                          .first.thumbnail,
                                                      text: category.name,
                                                      onTap: onCardTap,
                                                    )
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )))
                                      .toList(),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        }),
                  )
                ])
              : const Center(child: CircularProgressIndicator());
        });
  }
}
