import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hm_shop/routes/index.dart';
import 'package:hm_shop/controllers/auth_controller.dart';

void main(List<String> args) async {
  await GetStorage.init();
  Get.put(AuthController());
  runApp(getRootWidget());
}
