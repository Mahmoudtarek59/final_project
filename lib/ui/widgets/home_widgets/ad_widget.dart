import 'package:final_project/controllers/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AdWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return homeCubit.loading?Container():homeCubit.ad.isEmpty?Container():Container(
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(homeCubit.ad.toString()),fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
