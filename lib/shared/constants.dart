import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

double screenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

///Should protect it in .env file But left it here to make it easy to test
const String apiKey = "cd7bfe39damsh0bdafdffc12701cp19e298jsn7af126b2e4ae";

T? ambiguate<T>(T? value) => value;
