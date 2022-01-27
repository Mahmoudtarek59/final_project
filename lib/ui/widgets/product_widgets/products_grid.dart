import 'package:final_project/controllers/home_cubit/home_cubit.dart';
import 'package:final_project/models/home_models/product.dart';
import 'package:final_project/ui/widgets/product_widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductsGrid extends StatelessWidget {
  List<Product> products;
  ProductsGrid({required this.products});
  @override
  Widget build(BuildContext context) {
    return
        GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: products.length,
          padding: EdgeInsets.symmetric(
              horizontal: 5.0, vertical: 15.0),
          gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 4 / 5),
          itemBuilder: (context, index) => ProductItem(product: products[index]),
        );

  }
}
