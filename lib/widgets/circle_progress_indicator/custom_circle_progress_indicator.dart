import 'package:flutter/material.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColor.blue,
      ),
    );
  }
}
