import 'package:flutter/material.dart';
import '../../utils/ToastUtils.dart';
import '../../routes/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreedToTerms = false;

  final RegExp _accountPattern = RegExp(r'^[a-zA-Z0-9]{4,16}$');
  final RegExp _passwordPattern = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{6,18}$');

  static const String _correctAccount = 'admin';
  static const String _correctPassword = 'Admin123';

  String _accountError = '';
  String _passwordError = '';

  bool _validateAccount() {
    final account = _accountController.text.trim();
    if (account.isEmpty) {
      setState(() => _accountError = '账号不能为空');
      return false;
    }
    if (!_accountPattern.hasMatch(account)) {
      setState(() => _accountError = '账号为 4-16 位字母或数字');
      return false;
    }
    setState(() => _accountError = '');
    return true;
  }

  bool _validatePassword() {
    final password = _passwordController.text.trim();
    if (password.isEmpty) {
      setState(() => _passwordError = '密码不能为空');
      return false;
    }
    if (!_passwordPattern.hasMatch(password)) {
      setState(() => _passwordError = '密码为 6-18 位，需包含字母和数字');
      return false;
    }
    setState(() => _passwordError = '');
    return true;
  }

  bool _validateForm() {
    final accountValid = _validateAccount();
    final passwordValid = _validatePassword();

    if (!accountValid || !passwordValid) {
      ToastUtils.showError(context, '请完善表单信息');
      return false;
    }

    if (!_agreedToTerms) {
      ToastUtils.showError(context, '请勾选同意用户协议');
      return false;
    }

    if (_accountController.text.trim() != _correctAccount ||
        _passwordController.text.trim() != _correctPassword) {
      ToastUtils.showError(context, '账号或密码错误');
      return false;
    }

    return true;
  }

  bool _isLoginButtonEnabled() {
    final account = _accountController.text.trim();
    final password = _passwordController.text.trim();
    return account.isNotEmpty &&
        password.isNotEmpty &&
        _accountPattern.hasMatch(account) &&
        _passwordPattern.hasMatch(password) &&
        _agreedToTerms;
  }

  void _handleLogin() {
    if (_validateForm()) {
      ToastUtils.showSuccess(context, '登录成功，正在跳转...');
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/Main');
      });
    }
  }

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('慧多美登录'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '账号密码登录',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _accountController,
              keyboardType: TextInputType.text,
              onChanged: (_) => setState(() {}),
              onEditingComplete: _validateAccount,
              decoration: InputDecoration(
                labelText: '账号',
                hintText: '请输入账号',
                errorText: _accountError.isEmpty ? null : _accountError,
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.red),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              onChanged: (_) => setState(() {}),
              onEditingComplete: _validatePassword,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                errorText: _passwordError.isEmpty ? null : _passwordError,
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.red),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _agreedToTerms = !_agreedToTerms;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _agreedToTerms
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        width: 1.8,
                      ),
                      color: _agreedToTerms
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                    child: _agreedToTerms
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: '请查阅并同意 ',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                        children: const [
                          TextSpan(
                            text: '《隐藏条款》',
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: ' 和 ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: '《用户协议》',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isLoginButtonEnabled() ? _handleLogin : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('登录', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
