import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano/assets.dart';
import 'package:nano/constant/app_color.dart';
import 'package:nano/constant/app_padding.dart';
import 'package:nano/constant/app_size.dart';
import 'package:nano/constant/app_text_style.dart';
import 'package:nano/extension/num/num_extension.dart';
import 'package:nano/extension/string/string_extension.dart';
import 'package:nano/extension/widget/widget_extension.dart';
import 'package:nano/widgets/button/custom_button.dart';
import 'package:nano/widgets/textfield/custom_textfield.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  bool? emailValid = false;
  String? emailText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: AppColor.gradientBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.images.imAppLogoPNG,
                      width: AppSize.logoWidht,
                      height: AppSize.logoHeight,
                    ),
                  ),
                  AppPadding.extraLargePadding.height,
                  Text(
                    'Log In',
                    style: AppTextStyle.largeWhiteBoldText,
                  ),
                ],
              )
                  .paddingSymetric(
                      horizontal: AppPadding.largeHorizontalPadding,
                      vertical: AppPadding.verticalPadding)
                  .paddingOnly(top: AppPadding.extraLargePadding),
            ),
            Container(
              color: AppColor.white,
              child: Column(
                children: [
                  CustomTextfield(
                    title: "Email",
                    isEmail: true,
                    emailText: emailText,
                    emailVerify: emailValid,
                    onChanged: (value) {
                      value.isEmail == true
                          ? emailValid = true
                          : emailValid = false;
                      setState(() {
                        emailText = value;
                      });
                    },
                  ),
                  AppPadding.largePadding.height,
                  CustomTextfield(
                    title: "Password",
                    isPassword: true,
                  ),
                  AppPadding.largePadding.height,
                  CustomButton(
                    title: "Continue",
                    onTap: () {
                            Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
                    },
                  ),
                  AppPadding.largePadding.height,
                  Text("NEED HELP?",style: AppTextStyle.xsMediumRegularText,)
                ],
              ).paddingSymetric(
                  horizontal: AppPadding.largeHorizontalPadding,
                  vertical: AppPadding.verticalPadding),
            )
          ],
        ),
      ),
    );
  }
}
