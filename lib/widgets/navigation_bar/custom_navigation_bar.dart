import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/constant/app_padding.dart';
import 'package:nano_health_suite_app/constant/app_radius.dart';
import 'package:nano_health_suite_app/constant/app_size.dart';
import 'package:nano_health_suite_app/controller/base_scaffold_controller.dart';
import 'package:nano_health_suite_app/extension/list/list_extension.dart';
import 'package:nano_health_suite_app/extension/widget/widget_extension.dart';


class CustomNavBar extends ConsumerStatefulWidget {
  const CustomNavBar({Key? key,}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends ConsumerState<CustomNavBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final read = ref.read(baseScaffoldController);
    final activeIndex = ref.watch(baseScaffoldController).currentIndex;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: AppSize.screenHeight(context) * 0.09,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: AppRadius.navBarRadius,
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          padding: const EdgeInsets.all(AppPadding.smallPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: read.items
                .mapIndexed(
                  (value, index) => Expanded(
                    child: SizedBox(
                      height: AppSize.screenHeight(context) * 0.25,
                      width: AppSize.screenHeight(context) * 0.25,
                      child: AnimatedCrossFade(
                        reverseDuration: const Duration(milliseconds: 0),
                        firstChild: Center(
                          child: value.passiveWidget,
                        ),
                        secondChild: Center(
                          child: value.activeWidget,
                        ),
                        firstCurve: Curves.fastLinearToSlowEaseIn,
                        secondCurve: Curves.fastLinearToSlowEaseIn,
                        alignment: Alignment.center,
                        crossFadeState: activeIndex == index
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 0),
                      ),
                    ).gestureDetector(
                      onTap: () {
                        read.changeIndex(index);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
