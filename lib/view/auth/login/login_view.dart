import 'package:NanoHealthSuiteApp/assets.dart';
import 'package:NanoHealthSuiteApp/constant/app_color.dart';
import 'package:NanoHealthSuiteApp/constant/app_padding.dart';
import 'package:NanoHealthSuiteApp/constant/app_size.dart';
import 'package:NanoHealthSuiteApp/constant/app_text_style.dart';
import 'package:NanoHealthSuiteApp/extension/num/num_extension.dart';
import 'package:NanoHealthSuiteApp/extension/string/string_extension.dart';
import 'package:NanoHealthSuiteApp/extension/widget/widget_extension.dart';
import 'package:NanoHealthSuiteApp/view/base_scaffold/base_scaffold_view.dart';
import 'package:NanoHealthSuiteApp/view/product/all_product/all_product_view.dart';
import 'package:NanoHealthSuiteApp/widgets/button/custom_button.dart';
import 'package:NanoHealthSuiteApp/widgets/textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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
          context, MaterialPageRoute(builder: (context) => BaseScafoldView()));
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
