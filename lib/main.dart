import 'package:flutter/material.dart';
import 'package:phone_shop_app/product/constant/light_theme.dart';
import 'package:phone_shop_app/view/phone_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: LighTheme().theme, home: const PhoneScreenView());
  }
}
