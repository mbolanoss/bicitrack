import 'package:bicitrack/screens/home_screen.dart';
import 'package:bicitrack/screens/register_bike/register_bike_user.dart';
import 'package:bicitrack/screens/test_screen.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseUIAuth.configureProviders([
  //   EmailAuthProvider(),
  // ]);

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
      initialRoute: '/register_bike',
      // Aqui van las rutas de todas las ventanas
      routes: {
        '/': (context) => const HomeScreen(),
        '/test': (context) => const TestScreen(),
        '/login': (context) => const LoginScreen(),
        '/wrapper': (context) => Wrapper(),
        '/register_bike': (context) => const RegisterBikeUser(),
      },
    );
  }
}
