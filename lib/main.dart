import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/controllers/app_cubit/app_cubit.dart';
import 'package:final_project/controllers/category_cubit/category_cubit.dart';
import 'package:final_project/controllers/home_cubit/home_cubit.dart';
import 'package:final_project/translations/codegen_loader.g.dart';
import 'package:final_project/ui/screens/dashboard.dart';
import 'package:final_project/ui/screens/main_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => HomeCubit()..getHomeDataFromApi()),
        BlocProvider(create: (context) => CategoryCubit()..getCategoriesFromApi(),),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.green.shade50,
            appBarTheme: AppBarTheme(
              color: Colors.green.shade50,
              elevation: 0.0,
              titleTextStyle: TextStyle(color: Colors.black,fontSize: 18.0 ),
              iconTheme: IconThemeData(color: Colors.black)
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.green.shade50,
                elevation: 1.0,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey.shade500)),
        home: Dashboard(),
      ),
    );
  }
}
