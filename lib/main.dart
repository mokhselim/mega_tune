import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_tune/presentation/home_screen/home_screen.dart';
import 'package:mega_tune/shared/constants.dart';
import 'package:mega_tune/style/app_fonts.dart';
import 'package:mega_tune/style/app_theme.dart';

import 'helpers/cache_helper.dart';
import 'helpers/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        sliderTheme: defaultSliderTheme,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: dartTextTheme(context),
      ),
      navigatorKey: navigatorKey,
      home: HomeScreen(),
    );
  }
}
