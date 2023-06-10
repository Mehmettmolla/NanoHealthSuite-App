import 'package:flutter/material.dart';
import 'package:nano_health_suite_app/assets.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/constant/app_size.dart';
import 'package:nano_health_suite_app/view/auth/login/login_view.dart';

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
      // SecureStorage.getToken().then((value) {
      //   if (value != null) {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => BaseScafoldView()));
      //   } else {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const LoginView()));
      //   }
      // });
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
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            Assets.images.imAppLogoPNG,
            width: AppSize.logoWidht,
            height: AppSize.logoHeight,
          ),
        ),
      ),
    );
  }
}
