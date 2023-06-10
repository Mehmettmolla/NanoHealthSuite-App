import 'package:NanoHealthSuiteApp/constant/app_color.dart';
import 'package:NanoHealthSuiteApp/constant/app_radius.dart';
import 'package:NanoHealthSuiteApp/extension/widget/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.icon, this.padding, this.onPressed });
  final String? icon;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: AppRadius.cardRadius,
      ),
      child: SvgPicture.asset(
        icon!,
      ),
    ).gestureDetector(
      onTap: onPressed,
    );
  }
}
