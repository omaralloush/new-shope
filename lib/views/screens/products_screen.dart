import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_shope/services/api/api.dart';

import '../widgets/custom_card.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MainApi.getProducts(0, 0),
        builder: (context, products) => products.hasData
            ? SingleChildScrollView(
                child: StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: products.data!
                        .map((e) => StaggeredGridTile.count(
                            crossAxisCellCount:
                                calcSizeByRate(e.rating)['crossAxisCellCount']!,
                            mainAxisCellCount:
                                calcSizeByRate(e.rating)['mainAxisCellCount']!,
                            child: CustomCard(
                              coverImage: e.thumbnail,
                              text: e.title,
                              onTap: null,
                            )))
                        .toList()),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Map<String, int> calcSizeByRate(double rate) {
    int w, h;
    if (rate > 4.5) {
      w = 4;
      h = 2;
    } else if (rate > 3.5) {
      w = 4;
      h = 2;
    }
    // else if (rate > 3.5) {
    //   w = 4;
    //   h = 1;
    // } else if (rate > 3) {
    //   // w = 2;
    //   //   h = 2;
    // }
    else {
      w = 2;
      h = 2;
    }
    return {"crossAxisCellCount": w, 'mainAxisCellCount': h};
  }
}
