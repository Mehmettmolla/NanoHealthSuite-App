import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, this.rating = 5.0});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: true,
      itemSize: 25,
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: AppColor.starYellow,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
