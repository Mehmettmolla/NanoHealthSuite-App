import 'package:flutter/material.dart';
import 'package:nano/assets.dart';
import 'package:nano/constant/app_color.dart';
import 'package:nano/view/auth/login/login_view.dart';

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
