import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getRootWidget() {
  return GetMaterialApp(initialRoute: "/Main", getPages: getPages());
}

List<GetPage> getPages() {
  return [
    GetPage(name: "/Main", page: () => MainPage()),
    GetPage(name: "/login", page: () => const LoginPage()),
  ];
}

//返回该App的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {"/Main": (context) => MainPage(), "/login": (context) => LoginPage()};
}
