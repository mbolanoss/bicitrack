import 'package:bicitrack/screens/bicycle_view.dart';
import 'package:bicitrack/providers/bike_register_provider.dart';
import 'package:bicitrack/screens/dashboard.dart';
import 'package:bicitrack/screens/home_screen.dart';
import 'package:bicitrack/screens/register_bike/register_bike_owner.dart';
import 'package:bicitrack/screens/scan_nfc/ready_to_scan_screen.dart';
import 'package:bicitrack/screens/scan_nfc/scanning_successful_screen.dart';
import 'package:bicitrack/screens/scan_nfc/scanning_went_wrong_screen.dart';
import 'package:bicitrack/screens/test_screen.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/register_bike/register_bike.dart';
import 'screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FirebaseUIAuth.configureProviders([
  //   EmailAuthProvider(),
  // ]);

  // Usar un MultiProvider para acceder a los providers desde cualquier parte
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BikeRegisterProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      initialRoute: '/',
      // Aqui van las rutas de todas las ventanas
      routes: {
        '/': (context) => const HomeScreen(),
        '/test': (context) => const TestScreen(),
        '/login': (context) => const LoginScreen(),
        '/wrapper': (context) => Wrapper(),
        '/bicycle-view': (context) => const BicycleScreen(),
        '/register_bike_owner': (context) => RegisterBikeOwnerScreen(),
        '/register_bike': (context) => const RegisterBikeScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/ready_to_scan': (context) => const ReadyToScanScreen(),
        '/scanning_successful': (context) => const ScanningSuccessfulScreen(),
        '/scanning_went_wrong': (context) => const ScanningWentWrongScreen(),
      },
    );
  }
}
