import 'package:final_project/controllers/app_cubit/app_cubit.dart';
import 'package:final_project/ui/screens/main_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit appCubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: appCubit.index,
            items: appCubit.items,
            onTap: appCubit.changeIndex,
          ),
          body: appCubit.screens[appCubit.index],
        );
      },
    );
  }
}
