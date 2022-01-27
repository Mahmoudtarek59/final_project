import 'package:final_project/controllers/category_cubit/category_cubit.dart';
import 'package:final_project/models/category.dart';
import 'package:final_project/ui/widgets/product_widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  Category category;

  ProductsByCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name.toString()),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          CategoryCubit categoryCubit = BlocProvider.of<CategoryCubit>(context);
          return categoryCubit.loadingProductByCategory[category.id]!
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : categoryCubit.productsByCategory[category.id]!.isEmpty?Container(
            child: Center(
              child: Text("Empty"),
            ),
          ):ProductsGrid(products: categoryCubit.productsByCategory[category.id]!);
        },
      ),
    );
  }
}
