import 'package:bicitrack/services/login_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await LoginService().signOut();
            },
            child: Text('Sign out'),
          ),
        ),
      ),
    );
  }
}
