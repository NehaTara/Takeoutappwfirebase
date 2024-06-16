import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';
import 'auth_service.dart'; 

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Initially show login page
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = FirebaseAuthService();

    if (showLoginPage) {
      return LoginPage(onTap: togglePages, authService: authService);
    } else {
      return RegisterPage(onTap: togglePages, authService: authService);
    }
  }
}
