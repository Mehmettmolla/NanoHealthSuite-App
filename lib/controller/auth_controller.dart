import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nano_health_suite_app/constant/app_color.dart';
import 'package:nano_health_suite_app/model/login_model.dart';
import 'package:nano_health_suite_app/service/api_service.dart';
import 'package:nano_health_suite_app/view/base_scaffold/base_scaffold_view.dart';

final authController = ChangeNotifierProvider((ref) => AuthController());

class AuthController extends ChangeNotifier {
  final _email = TextEditingController();
  final _password = TextEditingController();

  TextEditingController get email => _email;
  TextEditingController get password => _password;

  Map<String, dynamic> _createMap() => {
        'username': _email.text,
        'password': _password.text,
      };

  void login(BuildContext context) {
    ApiService<LoginModel>()
        .postMethod(
      endPoint: 'auth/login',
      fromJson: (data) => LoginModel.fromJson(data),
      data: _createMap(),
      token: false,
    )
        .then((value) {
      if (value != null) {
        ApiService.saveToken(value.token ?? "");
        log("${value.token}", name: "Token");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BaseScafoldView()));
        Fluttertoast.showToast(
          msg: "Login Successfull",
          backgroundColor: Colors.black.withOpacity(0.6),
          textColor: AppColor.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        log("Error", name: "Error");
      }
    });
  }
}
