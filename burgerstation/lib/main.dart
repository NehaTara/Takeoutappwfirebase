import 'package:burgerstation/auth/login_or_register.dart';
import 'package:burgerstation/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:burgerstation/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart'; 

void main() async { // Make main async
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(
    MultiProvider(providers: [
      // theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),

      // restaurant provider
      ChangeNotifierProvider(create: (context) => Restaurant()),
    ],
    child: const MyApp(),
    ), 
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}