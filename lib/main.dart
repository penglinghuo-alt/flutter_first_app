import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hm_shop/routes/index.dart';
import 'package:hm_shop/viewmodels/auth_provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: getRootWidget(),
    ),
  );
}
