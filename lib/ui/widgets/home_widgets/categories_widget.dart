import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project/controllers/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        CategoryCubit categoryCubit =
        BlocProvider.of<CategoryCubit>(context);
        return categoryCubit.loading
            ? Container()
            : categoryCubit.categories.isEmpty
            ? Container()
            : GridView.builder(
          padding: EdgeInsets.symmetric(
              horizontal: 5.0, vertical: 15.0),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: categoryCubit.categories.length,
          gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 110.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) => Container(
            color: Colors.black.withOpacity(0.08),
            padding: EdgeInsets.only(bottom: 5.0),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(categoryCubit
                                .categories[index].image
                                .toString()),
                            fit: BoxFit.cover)),
                    child: Container(
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                ),
                Expanded(
                    child: AutoSizeText(
                      categoryCubit.categories[index].name.toString(),
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 13.0,
                      maxFontSize: 15.0,
                      maxLines: 1,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
