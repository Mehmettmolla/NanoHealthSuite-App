import 'package:NanoHealthSuiteApp/assets.dart';
import 'package:NanoHealthSuiteApp/constant/app_padding.dart';
import 'package:NanoHealthSuiteApp/extension/widget/widget_extension.dart';
import 'package:NanoHealthSuiteApp/view/product/product_detail/product_detail_view.dart';
import 'package:NanoHealthSuiteApp/widgets/app_bar/custom_app_bar.dart';
import 'package:NanoHealthSuiteApp/widgets/card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProductView extends ConsumerStatefulWidget {
  const AllProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllProductViewState();
}

class _AllProductViewState extends ConsumerState<AllProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Products',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.verticalPadding,
                  horizontal: AppPadding.horizontalPadding),
              itemBuilder: (context, index) {
                return ProductCard(
                  productDescription: 'Product Description',
                  productImage: Assets.images.imProductPNG,
                  productName: 'Product Name',
                  productPrice: "1000",
                  productRating: 4.5,
                ).gestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetailView()));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
