import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health_suite_app/assets.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/constant/app_padding.dart';
import 'package:nano_health_suite_app/constant/app_size.dart';
import 'package:nano_health_suite_app/constant/app_text_style.dart';
import 'package:nano_health_suite_app/controller/auth_controller.dart';
import 'package:nano_health_suite_app/extension/num/num_extension.dart';
import 'package:nano_health_suite_app/extension/string/string_extension.dart';
import 'package:nano_health_suite_app/extension/widget/widget_extension.dart';
import 'package:nano_health_suite_app/widgets/button/custom_button.dart';
import 'package:nano_health_suite_app/widgets/textfield/custom_textfield.dart';

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
    final read = ref.read(authController);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            loginBg(),
            loginBody(read, context)
          ],
        ),
      ),
    );
  }

  Container loginBody(AuthController read, BuildContext context) {
    return Container(
            color: AppColor.white,
            child: Column(
              children: [
                CustomTextfield(
                  title: "Email",
                  isEmail: true,
                  emailText: emailText,
                  controller: read.email,
                  emailVerify: emailValid,
                  onChanged: (value) {
                    value.isEmail == true || value.isNotShort == true
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
                  controller: read.password,
                  isPassword: true,
                ),
                AppPadding.largePadding.height,
                CustomButton(
                  title: "Continue",
                  onTap: () {
                    read.login(context);
                  },
                ),
                AppPadding.largePadding.height,
                Text(
                  "NEED HELP?",
                  style: AppTextStyle.xsMediumRegularText,
                )
              ],
            ).paddingSymetric(
                horizontal: AppPadding.largeHorizontalPadding,
                vertical: AppPadding.verticalPadding),
          );
  }

  Container loginBg() {
    return Container(
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
          );
  }
}
