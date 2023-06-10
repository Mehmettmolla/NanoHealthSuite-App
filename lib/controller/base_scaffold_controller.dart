import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health_suite_app/assets.dart';
import 'package:nano_health_suite_app/view/product/all_product/all_product_view.dart';


final baseScaffoldController =
    ChangeNotifierProvider((ref) => BaseScaffoldController());

class BaseScaffoldController extends ChangeNotifier {
  List<BottomNavModel> items = [
    BottomNavModel(
        view: const AllProductView(),
        activeWidget: SvgPicture.asset(Assets.icons.icProductActiveSVG),
        passiveWidget: SvgPicture.asset(Assets.icons.icProductPassiveSVG),
        dx: 0,
        size: 0),
    BottomNavModel(
        view: const AllProductView(),
        activeWidget: SvgPicture.asset(
          Assets.icons.icShoppingActiveSVG,
        ),
        passiveWidget: SvgPicture.asset(Assets.icons.icShoppingPassiveSVG),
        dx: 0,
        size: 0),
    BottomNavModel(
        view: const AllProductView(),
        activeWidget: SvgPicture.asset(Assets.icons.icLikeActiveSVG),
        passiveWidget: SvgPicture.asset(Assets.icons.icLikePassiveSVG),
        dx: 0,
        size: 0),
    BottomNavModel(
        view: const AllProductView(),
        activeWidget: SvgPicture.asset(Assets.icons.icProfileActiveSVG),
        passiveWidget: SvgPicture.asset(Assets.icons.icProfilePassiveSVG),
        dx: 0,
        size: 0),
  ];

  int currentIndex = 0;

  Widget body() => items[currentIndex].view;

  void changeIndex(int index) {
    currentIndex = index;
    selectedPosition =
        items[currentIndex].dx + ((items[currentIndex].size / 2) - 2);
    notifyListeners();
  }

  double selectedPosition = 45;
}

class BottomNavModel {
  Widget view;
  Widget? activeWidget;
  Widget? passiveWidget;
  double dx;
  double size;
  BottomNavModel({
    required this.view,
    required this.passiveWidget,
    required this.activeWidget,
    required this.dx,
    required this.size,
  });
}
