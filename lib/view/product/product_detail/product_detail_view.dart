import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health_suite_app/assets.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/constant/app_padding.dart';
import 'package:nano_health_suite_app/constant/app_radius.dart';
import 'package:nano_health_suite_app/constant/app_size.dart';
import 'package:nano_health_suite_app/constant/app_text_style.dart';
import 'package:nano_health_suite_app/controller/product_controller.dart';
import 'package:nano_health_suite_app/extension/num/num_extension.dart';
import 'package:nano_health_suite_app/extension/widget/widget_extension.dart';
import 'package:nano_health_suite_app/widgets/button/custom_button.dart';
import 'package:nano_health_suite_app/widgets/button/custom_icon_button.dart';
import 'package:nano_health_suite_app/widgets/rating_bar/custom_rating_bar.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  const ProductDetailView({super.key, this.productId = 0});
  final int productId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailViewState();
}

class _ProductDetailViewState extends ConsumerState<ProductDetailView> {
  @override
  void initState() {
    super.initState();

    ref.read(productController).getASignleProduct(widget.productId);
  }

  bool? isUp = false;
  @override
  Widget build(BuildContext context) {
    final read = ref.read(productController);
    final watch = ref.watch(productController);
    return Scaffold(
      body: watch.getASingleProductModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                productImage(read, context),
                icons(context)
                    .paddingSymetric(
                      horizontal: AppPadding.smallHorizontalPadding,
                    )
                    .paddingOnly(top: AppPadding.largeHorizontalPadding),
                bottomSheet(context, read),
              ],
            ),
    );
  }

  Positioned bottomSheet(BuildContext context, ProductController read) {
    return Positioned.fill(
                top: isUp!
                    ? AppSize.screenHeight(context) * 0.5
                    : AppSize.screenHeight(context) * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      read.getASingleProductModel!.price.toString(),
                      style: AppTextStyle.largeBoldText,
                    ).paddingSymetric(
                      horizontal: AppPadding.smallHorizontalPadding,
                    ),
                    Container(
                      height: isUp!
                          ? AppSize.screenHeight(context) * 0.4
                          : AppSize.screenHeight(context) * 0.28,
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
                                  ? SvgPicture.asset(
                                      Assets.icons.icArrowUpSVG)
                                  : SvgPicture.asset(
                                      Assets.icons.icArrowDownSVG),
                            ),
                          ),
                          AppPadding.smallPadding.height,
                          Row(
                            children: [
                              CustomIconButton(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.shareButtonPadding,
                                    vertical: AppPadding.shareButtonPadding),
                                icon: Assets.icons.icShareSVG,
                                onPressed: () {},
                              ),
                              const Spacer(),
                              CustomButton(
                                title: "Order Now",
                                onTap: () {
                                  Navigator.pop(context);
                                },
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
                              read.getASingleProductModel!.description!,
                              maxLines: 4,
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rewiews(${read.getASingleProductModel!.rating?.count})",
                                      style: AppTextStyle.xsMediumRegularText,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          read.getASingleProductModel!.rating!
                                              .rate
                                              .toString(),
                                          style: AppTextStyle.largeText,
                                        ),
                                        AppPadding.mediumPadding.width,
                                        CustomRatingBar(
                                          rating: read.getASingleProductModel!
                                              .rating!.rate!,
                                        )
                                      ],
                                    ).paddingOnly(
                                        left: AppPadding
                                            .smallHorizontalPadding),
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
              );
  }

  Align icons(BuildContext context) {
    return Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomIconButton(
                          padding: const EdgeInsets.all(
                              AppPadding.extraSmallHorizontalPadding),
                          icon: Assets.icons.icBackArrowSVG,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Spacer(),
                        CustomIconButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.smallHorizontalPadding,
                              vertical: AppPadding.smallVerticalPadding),
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
              );
  }

  Hero productImage(ProductController read, BuildContext context) {
    return Hero(
                tag: read.getASingleProductModel!.id!,
                child: Image.network(
                  read.getASingleProductModel!.image!,
                  height: AppSize.screenHeight(context) * 0.75,
                  width: AppSize.screenWidth(context),
                  fit: BoxFit.fill,
                ),
              );
  }
}
