import 'package:NanoHealthSuiteApp/assets.dart';
import 'package:NanoHealthSuiteApp/constant/app_color.dart';
import 'package:NanoHealthSuiteApp/view/auth/login/login_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColor.gradientBlue,
      ),
      child: Center(
        child: Image.asset(
          Assets.images.imAppLogoPNG,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
