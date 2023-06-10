// ignore_for_file: unnecessary_brace_in_string_interps, library_private_types_in_public_api

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nano_health_suite_app/constant/app_contstant.dart';
import 'package:nano_health_suite_app/service/local_service.dart';

typedef _FromJson = Function(Map<String, dynamic> type)?;

class ApiService<T> {
  static Future<Options?> getOptions() async {
    final token = await SecureStorage.getToken();
    return Options(headers: {
      "Authorization": "Bearer $token",
    });
  }

  static saveToken(String token) async {
    await SecureStorage.setToken(token);
  }

  Future<T?> getMethod(
      {required String endPoint,
      bool token = true,
      _FromJson? fromJson,
      bool? isList = false}) async {
    Response? response;
    final dio = Dio();
    try {
      final options = await ApiService.getOptions();
      response = await dio.get("${AppConstant.BASE_URL}${endPoint}",
          options: token ? options : null);
      log("${response.data}", name: "${AppConstant.BASE_URL}${endPoint}");
      if (response.statusCode == HttpStatus.ok) {
        return isList == false
            ? fromJson == null
                ? response.data
                : fromJson(response.data)
            : response.data;
      } else {
        log(response.statusCode.toString(), name: "GET ERROR");
        return null;
      }
    } catch (error) {
      log(error.toString(), name: "GET ERROR");
      Fluttertoast.showToast(
        msg: "There was a problem, try again.",
        backgroundColor: Colors.black.withOpacity(0.6),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
    return null;
  }

  Future<T?> postMethod(
      {required String endPoint,
      bool token = true,
      Map<String, dynamic>? data,
      _FromJson fromJson,
      bool isLoad = true}) async {
    Response response;
    final dio = Dio();
    try {
      final options = await ApiService.getOptions();
      response = await dio.post("${AppConstant.BASE_URL}${endPoint}",
          data: data, options: token ? options : null);
      log("${response.data}", name: "${AppConstant.BASE_URL}${endPoint}");
      if (response.statusCode == HttpStatus.ok) {
        return fromJson == null ? response.data : fromJson(response.data);
      } else {
        log(response.statusCode.toString(), name: "POST ERROR");
        return null;
      }
    } catch (error) {
      log(error.toString(), name: "POST ERROR");
      Fluttertoast.showToast(
        msg: "There was a problem, try again.",
        backgroundColor: Colors.black.withOpacity(0.6),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
    return null;
  }
}
