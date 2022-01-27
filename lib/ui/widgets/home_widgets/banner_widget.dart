import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/controllers/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BannerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit bannersCubit =
        BlocProvider.of<HomeCubit>(context);
        return bannersCubit.loading
            ? Container(
              child: Center(
          child: CircularProgressIndicator(),
        ),
            )
            : bannersCubit.banners.isEmpty
            ? Container()
            : CarouselSlider(
          items: bannersCubit.banners
              .map((e) => Container(
            decoration: BoxDecoration(
                color: Colors.green.shade50,
                image: DecorationImage(
                    image: NetworkImage(
                        e.image.toString()),
                    fit: BoxFit.cover)),
          ))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            reverse: false,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        );
      },
    );
  }
}
