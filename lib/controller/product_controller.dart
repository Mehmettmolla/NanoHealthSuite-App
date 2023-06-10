import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_health_suite_app/model/get_a_single_product_model.dart';
import 'package:nano_health_suite_app/model/product_model.dart';
import 'package:nano_health_suite_app/service/api_service.dart';

final productController =
    ChangeNotifierProvider.autoDispose((ref) => ProductController());

class ProductController extends ChangeNotifier {
  List productList = [];
  GetASingleProductModel? getASingleProductModel;

  void getAllProducts() {
    ApiService().getMethod(endPoint: 'products', isList: true).then((value) {
      if (value != null) {
        productList = value.map((data) => Product.fromJson(data)).toList();
        notifyListeners();
      } else {
        log("Error", name: "Error");
      }
    });
  }

  void getASignleProduct(int id) {
    ApiService<GetASingleProductModel>()
        .getMethod(
      endPoint: 'products/$id',
      fromJson: (json) => GetASingleProductModel.fromJson(json),
    )
        .then((value) {
      if (value != null) {
        getASingleProductModel = value;
        notifyListeners();
      } else {
        log("Error", name: "Error");
      }
    });
  }
}
