import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health_suite_app/controller/base_scaffold_controller.dart';
import 'package:nano_health_suite_app/widgets/navigation_bar/custom_navigation_bar.dart';



// ignore: must_be_immutable
class BaseScafoldView extends ConsumerStatefulWidget {
   BaseScafoldView({Key? key,this.index}) : super(key: key);
  int? index;
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BaseScafoldViewState();
}

class _BaseScafoldViewState extends ConsumerState<BaseScafoldView> {
  void setIndex() => ref.read(baseScaffoldController.notifier).currentIndex = 0;
 void setTabbarIndex(int index) => ref.read(baseScaffoldController.notifier).currentIndex = index;
  @override
  void initState() {
    super.initState();
    widget.index != null ? setTabbarIndex(widget.index!) :
    setIndex();
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(baseScaffoldController);
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      extendBody: true,
      body: watch.body(),
    );
  }
}
