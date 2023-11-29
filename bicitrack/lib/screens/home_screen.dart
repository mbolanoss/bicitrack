import 'package:bicitrack/screens/bicycle_view.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await LoginService().signOut();
                },
                child: const Text('Sign out'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register_bike_owner');
                },
                child: const Text('Register bike'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        const testSerialNumber = "46TFS66DA";
                        return BicycleScreen(serialNumber: testSerialNumber);
                      }
                  ));
                },
                child: const Text('Bicycle View'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: const Text('Dashboard'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ready_to_scan');
                },
                child: const Text('Ready to Scan'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/scanning_successful');
                },
                child: const Text('Entry Registered'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/scanning_went_wrong');
                },
                child: const Text(
                  'Wrong scan',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
