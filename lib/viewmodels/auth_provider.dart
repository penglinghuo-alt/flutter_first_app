import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _username;
  String? _token;

  bool get isLoggedIn => _isLoggedIn;
  String? get username => _username;
  String? get token => _token;

  void login(String username, String token) {
    _isLoggedIn = true;
    _username = username;
    _token = token;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _username = null;
    _token = null;
    notifyListeners();
  }

  void clearError() {
    notifyListeners();
  }
}
