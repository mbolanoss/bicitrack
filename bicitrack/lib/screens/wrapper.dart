import 'package:bicitrack/screens/home_screen.dart';
import 'package:bicitrack/screens/login_screen.dart';
import 'package:bicitrack/services/login_service.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final loginService = LoginService();
  Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: loginService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
