import 'package:burgerstation/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
class RegisterPage extends StatefulWidget {
  
  final void Function()? onTap;
   
   const RegisterPage({super.key, required this.onTap, required FirebaseAuthService authService});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = 
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //message, app slogan
            Text(
              "Let's Create an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),
              
            //email textfield
            MyTextField(
              controller: emailController, 
              hintText: "Email", 
              obscureText: false,
              ),

            const SizedBox(height: 10),

            //password textfield
            MyTextField(
              controller: passwordController, 
              hintText: "Password", 
              obscureText: true,
              ),

            const SizedBox(height: 10),

            //confirm password textfield
            MyTextField(
              controller: confirmpasswordController, 
              hintText: "Confirm password", 
              obscureText: true,
              ),

            const SizedBox(height: 10),

            //sign up button
            MyButton(
              text: "Sign up",
              onTap: () {},
            ), //MyButton

            const SizedBox(height: 25),

            //already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                const SizedBox (width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ), //Row
          ],
        ),
      ),
    );
  }
}