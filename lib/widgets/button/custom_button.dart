import 'package:flutter/cupertino.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/constant/app_radius.dart';
import 'package:nano_health_suite_app/constant/app_size.dart';
import 'package:nano_health_suite_app/constant/app_text_style.dart';


// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.color,
    this.width = 1.0,
    this.height = 0.082,
  });
  final String? title;
  final VoidCallback? onTap;
  Color? color;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: AppSize.screenWidth(context) * width!,
        height: AppSize.screenHeight(context) * height!,
        child: CupertinoButton(
            color: color ?? AppColor.blue,
            borderRadius: AppRadius.buttonRadius,
            onPressed: onTap,
            child: Text(title!, style: AppTextStyle.mediumWhiteRegularText)));
  }
}
