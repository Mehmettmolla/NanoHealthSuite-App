import 'package:NanoHealthSuiteApp/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomArrowButton extends StatefulWidget {
  const CustomArrowButton({super.key});
  

  @override
  State<CustomArrowButton> createState() => _CustomArrowButtonState();
}

class _CustomArrowButtonState extends State<CustomArrowButton> {
   bool? isUp = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
        isUp = !isUp!;
        });
      },
      child: isUp!
          ? SvgPicture.asset(Assets.icons.icArrowUpSVG)
          :SvgPicture.asset(Assets.icons.icArrowDownSVG)
           ,
    );
  }
}
