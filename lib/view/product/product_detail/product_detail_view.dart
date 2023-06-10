import 'package:NanoHealthSuiteApp/assets.dart';
import 'package:NanoHealthSuiteApp/constant/app_color.dart';
import 'package:NanoHealthSuiteApp/constant/app_padding.dart';
import 'package:NanoHealthSuiteApp/constant/app_radius.dart';
import 'package:NanoHealthSuiteApp/constant/app_size.dart';
import 'package:NanoHealthSuiteApp/constant/app_text_style.dart';
import 'package:NanoHealthSuiteApp/extension/num/num_extension.dart';
import 'package:NanoHealthSuiteApp/extension/widget/widget_extension.dart';
import 'package:NanoHealthSuiteApp/widgets/button/custom_arrow_button.dart';
import 'package:NanoHealthSuiteApp/widgets/button/custom_button.dart';
import 'package:NanoHealthSuiteApp/widgets/button/custom_icon_button.dart';
import 'package:NanoHealthSuiteApp/widgets/rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  const ProductDetailView({super.key, this.productId});
  final int? productId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailViewState();
}

class _ProductDetailViewState extends ConsumerState<ProductDetailView> {
  bool? isUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.images.imProductPNG,
            height: AppSize.screenHeight(context) * 0.75,
            width: AppSize.screenWidth(context),
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      padding: const EdgeInsets.all(12),
                      icon: Assets.icons.icBackArrowSVG,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    CustomIconButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 9),
                      icon: Assets.icons.icThreeDotSVG,
                    ),
                  ],
                ),
                AppPadding.smallPadding.height,
                Text(
                  "Detail",
                  style: AppTextStyle.xsLargeBoldWhiteText,
                ),
              ],
            ),
          )
              .paddingSymetric(
                horizontal: AppPadding.smallHorizontalPadding,
              )
              .paddingOnly(top: AppPadding.largeHorizontalPadding),
          Positioned.fill(
            top: isUp!
                ? AppSize.screenHeight(context) * 0.5
                : AppSize.screenHeight(context) * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "0000 AED",
                  style: AppTextStyle.largeBoldText,
                ).paddingSymetric(
                  horizontal: AppPadding.smallHorizontalPadding,
                ),
                Container(
                  height: 
                  isUp!
                      ? AppSize.screenHeight(context) * 0.4
                      :
                  AppSize.screenHeight(context) * 0.28,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: AppRadius.bottomSheetRadius,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isUp = !isUp!;
                            });
                          },
                          child: isUp == false
                              ? SvgPicture.asset(Assets.icons.icArrowUpSVG)
                              : SvgPicture.asset(Assets.icons.icArrowDownSVG),
                        ),
                      ),
                      AppPadding.smallPadding.height,
                      Row(
                        children: [
                          CustomIconButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 17),
                            icon: Assets.icons.icShareSVG,
                            onPressed: () {},
                          ),
                          const Spacer(),
                          CustomButton(
                            title: "Order Now",
                            onTap: () {},
                            width: 0.75,
                            height: 0.07,
                          )
                        ],
                      ),
                      AppPadding.smallPadding.height,
                      Text(
                        "Description",
                        style: AppTextStyle.xsMediumItalicText,
                      ),
                      Expanded(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                          maxLines: 5,
                          style: AppTextStyle.smallText,
                        ),
                      ),
                      AppPadding.smallPadding.height,
                      Visibility(
                        visible: isUp!,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius: AppRadius.reviewCardRadius,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rewiews(100)",style: AppTextStyle.xsMediumRegularText,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("4.44",style: AppTextStyle.largeText,),
                                  AppPadding.mediumPadding.width,
                                  const CustomRatingBar(
                                    rating: 4.44,
                                  )
                                ],
                              ).paddingOnly(left: AppPadding.smallHorizontalPadding),
                          ]),
                        ),
                      )
              
                    ],
                  ).paddingSymetric(
                    horizontal: AppPadding.smallHorizontalPadding,
                    vertical: AppPadding.smallHorizontalPadding,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
