import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final _storage = GetStorage();
  final _storageKey = 'auth_token';
  final _usernameKey = 'auth_username';

  final _isLoggedIn = false.obs;
  final _username = ''.obs;
  final _token = ''.obs;

  bool get isLoggedIn => _isLoggedIn.value;
  String get username => _username.value;
  String get token => _token.value;

  RxBool get isLoggedInObs => _isLoggedIn;
  RxString get usernameObs => _username;
  RxString get tokenObs => _token;

  @override
  void onInit() {
    super.onInit();
    loadAuth();
  }

  void loadAuth() {
    final savedToken = _storage.read(_storageKey);
    final savedUsername = _storage.read(_usernameKey);
    if (savedToken != null && savedToken.toString().isNotEmpty) {
      _token.value = savedToken.toString();
      _username.value = savedUsername?.toString() ?? '';
      _isLoggedIn.value = true;
    }
  }

  void login(String username, String token) {
    _username.value = username;
    _token.value = token;
    _isLoggedIn.value = true;
    _storage.write(_storageKey, token);
    _storage.write(_usernameKey, username);
  }

  void logout() {
    _isLoggedIn.value = false;
    _username.value = '';
    _token.value = '';
    _storage.remove(_storageKey);
    _storage.remove(_usernameKey);
  }

  void clearSession() {
    logout();
  }
}
