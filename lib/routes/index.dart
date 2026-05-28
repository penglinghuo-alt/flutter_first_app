import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

//返回APP根组件
Widget getRootWidget() {
  return MaterialApp(initialRoute: "/Main", routes: getRootRoutes());
}

//返回该App的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {"/Main": (context) => MainPage(), "/login": (context) => LoginPage()};
}
