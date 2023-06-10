import 'package:flutter/material.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/constant/app_padding.dart';
import 'package:nano_health_suite_app/constant/app_radius.dart';
import 'package:nano_health_suite_app/constant/app_size.dart';
import 'package:nano_health_suite_app/constant/app_text_style.dart';
import 'package:nano_health_suite_app/extension/num/num_extension.dart';
import 'package:nano_health_suite_app/extension/widget/widget_extension.dart';
import 'package:nano_health_suite_app/widgets/rating_bar/custom_rating_bar.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.productPrice, this.productName, this.productDescription, this.productImage, this.productRating, this.productId});
  final String? productPrice;
  final String? productName;
  final String? productDescription;
  final String? productImage;
  final double? productRating;
  final int? productId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: AppRadius.cardRadius,
              child: Hero(
                tag: productId ?? "",
                child: Image.network(
                  productImage ?? "",
                  fit: BoxFit.fill,
                  height: AppSize.screenHeight(context) * 0.24,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  productPrice ?? "",
                  style: AppTextStyle.xlMediumRegularText,
                ),
                const Spacer(),
                 CustomRatingBar(
                  rating: productRating ?? 0,
                ),
              ],
            ).paddingSymetric(
              horizontal: AppPadding.smallPadding,
              vertical: AppPadding.smallPadding,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName ?? "",
              style: AppTextStyle.xsMediumItalicText,
            ),
            Text(
              productDescription ?? "",
              style: AppTextStyle.xsSmallText,
            ),
          ],
        ).paddingSymetric(
          vertical: AppPadding.mediumPadding,
        ),
        Container(
          width: AppSize.productWidht,
          height: 1,
          color: AppColor.black.withOpacity(0.1),
        ),
        AppPadding.mediumPadding.height
      ],
    );
  }
}
