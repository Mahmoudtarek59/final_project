import 'package:bloc/bloc.dart';
import 'package:final_project/translations/locale_keys.g.dart';
import 'package:final_project/ui/screens/main_screens/account_screen.dart';
import 'package:final_project/ui/screens/main_screens/categories_screen.dart';
import 'package:final_project/ui/screens/main_screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:easy_localization/easy_localization.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  int index = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: LocaleKeys.home.tr().toUpperCase()),
    BottomNavigationBarItem(icon: Icon(Icons.category),label: LocaleKeys.categories.tr().toUpperCase()),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: LocaleKeys.account.tr().toUpperCase()),
  ];

  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    AccountScreen(),
  ];

  changeIndex(index){
    this.index = index;
    emit(ChangeIndexState());
  }
}
