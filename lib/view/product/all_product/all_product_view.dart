import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health_suite_app/constant/app_padding.dart';
import 'package:nano_health_suite_app/controller/product_controller.dart';
import 'package:nano_health_suite_app/extension/widget/widget_extension.dart';
import 'package:nano_health_suite_app/view/product/product_detail/product_detail_view.dart';
import 'package:nano_health_suite_app/widgets/app_bar/custom_app_bar.dart';
import 'package:nano_health_suite_app/widgets/card/product_card.dart';

class AllProductView extends ConsumerStatefulWidget {
  const AllProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllProductViewState();
}

class _AllProductViewState extends ConsumerState<AllProductView> {
  @override
  void initState() {
    super.initState();
    ref.read(productController).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(productController);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Products',
      ),
      body: 
      watch.productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :
      productList(watch).paddingOnly(
          bottom: AppPadding.verticalPadding,
      ),
    );
  }

  Column productList(ProductController watch) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: watch.productList.length,
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.verticalPadding,
                horizontal: AppPadding.horizontalPadding),
            itemBuilder: (context, index) {
              final item = watch.productList[index];
              return ProductCard(
                productDescription: item.description,
                productImage: item.image,
                productName: item.title,
                productPrice: item.price.toString(),
                productRating: item.rating.rate,
                productId: item.id,
              ).gestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailView(productId: item.id,)));
                },
              );
            },
          ),
        )
      ],
    );
  }
}
