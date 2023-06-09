import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health_suite_app/assets.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/constant/app_size.dart';
import 'package:nano_health_suite_app/constant/app_text_style.dart';
import 'package:nano_health_suite_app/extension/widget/widget_extension.dart';
import 'package:nano_health_suite_app/widgets/circle_progress_indicator/custom_circle_progress_indicator.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  CustomTextfield(
      {super.key,
      required this.title,
      this.isEmail = false,
      this.isPassword = false,
      this.controller,
      this.value = 1,
      this.emailVerify,
      this.emailText,
      this.onChanged});
  final TextEditingController? controller;
  final String title;
  final bool? isEmail;
  final bool? isPassword;
  final num? value;
  final bool? emailVerify;
  final String? emailText;

  Function(String)? onChanged;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isObscure = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.screenHeight(context) * 0.06,
      width: AppSize.screenWidth(context) * widget.value!,
      child: Theme(
        data: ThemeData(
          primaryColor: AppColor.blue,
          primaryColorDark: AppColor.blue,
          primaryColorLight: AppColor.blue,
        ),
        child: TextField(
          focusNode: _focusNode,
          controller: widget.controller,
          cursorColor: AppColor.blue,
          onChanged: widget.onChanged,
          style: AppTextStyle.xsMediumRegularText,
          keyboardType: widget.isEmail == true
              ? TextInputType.emailAddress
              : widget.isPassword == true
                  ? TextInputType.visiblePassword
                  : TextInputType.text,
          obscureText:
              widget.isPassword == true && isObscure == true ? true : false,
          decoration: InputDecoration(
            fillColor: AppColor.white,
            labelText: widget.title,
            labelStyle: AppTextStyle.mediumText,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 35,
              minHeight: 35,
            ),
            suffixIcon: widget.isPassword == true
                ? isObscure == false
                    ? IconButton(
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = true;
                          });
                        },
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = false;
                          });
                        },
                      )
                : widget.isEmail == true
                    ? widget.emailText == null || widget.emailText == ""
                        ? null
                        : widget.emailVerify == true
                            ? SvgPicture.asset(Assets.icons.icCheckMarkSVG)
                                .paddingOnly(right: 15)
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  CustomCircleProgressIndicator()
                                ],
                              )
                    : null,
          ),
        ),
      ),
    );
  }
}
