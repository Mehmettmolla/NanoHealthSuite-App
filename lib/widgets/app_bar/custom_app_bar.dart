import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/constant/app_padding.dart';
import 'package:nano_health_suite_app/constant/app_radius.dart';
import 'package:nano_health_suite_app/constant/app_text_style.dart';
import 'package:nano_health_suite_app/extension/widget/widget_extension.dart';

class CustomAppBar extends ConsumerStatefulWidget with PreferredSizeWidget {
  CustomAppBar(
      {super.key,
      this.isBack = false,
      this.title = "",
      this.preferredSize = const Size.fromHeight(88)});
  final bool? isBack;
  final String? title;
  @override
  final Size preferredSize;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: AppRadius.appBarRadius,
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        height: widget.preferredSize.height +
            MediaQuery.of(context).padding.top / 2,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        width: double.maxFinite,
        child: Center(
          child: Text(
            widget.title!,
            style: AppTextStyle.xsLargeBoldText,
          ).paddingOnly(bottom: AppPadding.verticalPadding),
        ));
  }
}
