import 'package:bicitrack/services/login_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await LoginService().signOut();
                },
                child: const Text('Sign out'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(LoginService().currentUser!.email);
                  print(LoginService().currentUser!.id);
                },
                child: const Text('Current user'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/bicycle-view');
                },
                child: const Text('Bicycle View'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: const Text('Dashboard'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ready_to_scan');
                },
                child: const Text('Ready to Scan'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/scanning_successful');
                },
                child: const Text('Entry Registered'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/scanning_went_wrong');
                },
                child: const Text('Something Went Wrong'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
