import 'package:flutter/material.dart';
import 'package:burgerstation/auth/auth_service.dart';
import 'package:burgerstation/components/my_button.dart';
import 'package:burgerstation/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  final AuthService authService;

  const RegisterPage({
    Key? key,
    required this.onTap,
    required this.authService,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 10),
            Text(
                "Register",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            const SizedBox(height: 25),
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),
            MyButton(
              text: "Register",
              onTap: () async {
                if (passwordController.text != confirmPasswordController.text) {
                  print("Passwords don't match");
                  return; // Early return if passwords don't match
                }
                try {
                  await widget.authService
                      .register(emailController.text, passwordController.text);
                  // Asserting onTap is not null before calling it
                  widget.onTap!(); // Using! to assert onTap is not null
                } catch (e) {
                  print(e);
                  // Optionally, show an error message to the user
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
