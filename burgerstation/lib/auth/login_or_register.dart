import 'package:burgerstation/pages/login_page.dart';
import 'package:burgerstation/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //initially show login page
  bool showLoginPage = true;
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

 //toggle between login and register page

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}