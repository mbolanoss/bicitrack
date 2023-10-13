import 'package:bicitrack/screens/home_screen.dart';
import 'package:bicitrack/screens/test_screen.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';

void main() {
  // Usar un MultiProvider para acceder a los providers desde cualquier parte
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      // Cambiar ruta inicial segun sea necesario
      initialRoute: '/test',
      // Aqui van las rutas de todas las ventanas
      routes: {
        '/': (context) => const HomeScreen(),
        '/test': (context) => const TestScreen(),
      },
    );
  }
}
