import 'package:flutter/cupertino.dart';
import 'package:nano/constant/app_color.dart';
import 'package:nano/constant/app_radius.dart';
import 'package:nano/constant/app_size.dart';
import 'package:nano/constant/app_text_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.color,
  });
  final String? title;
  final VoidCallback? onTap;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: AppSize.screenWidth(context),
        height: AppSize.screenHeight(context) * 0.082,
        child: CupertinoButton(
            color: color ?? AppColor.blue,
            borderRadius: AppRadius.buttonRadius,
            onPressed: onTap,
            child: Text(title!, style: AppTextStyle.mediumWhiteRegularText)));
  }
}
