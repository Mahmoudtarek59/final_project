import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/controllers/category_cubit/category_cubit.dart';
import 'package:final_project/controllers/home_cubit/home_cubit.dart';
import 'package:final_project/translations/locale_keys.g.dart';
import 'package:final_project/ui/widgets/home_widgets/ad_widget.dart';
import 'package:final_project/ui/widgets/home_widgets/banner_widget.dart';
import 'package:final_project/ui/widgets/home_widgets/categories_widget.dart';
import 'package:final_project/ui/widgets/product_widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AdWidget(),
          CategoriesWidget(),
          BannerWidget(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
              return homeCubit.loading
                  ? Container()
                  : homeCubit.products.isEmpty
                  ? Container()
                  : ProductsGrid(products: homeCubit.products);
            },
          ),
        ],
      ),
    );
  }
}
