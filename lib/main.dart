import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano/constant/app_color.dart';
import 'package:nano/view/splash/splash_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nano Health Suite App',
      debugShowCheckedModeBanner: false,
      color: AppColor.blue,
      theme: ThemeData(
        fontFamily: 'Open Sans',
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
