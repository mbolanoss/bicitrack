import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/form_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return SafeArea(
      child: Scaffold(
        body: Container(
          // Margen de toda la pantalla
          margin: EdgeInsets.symmetric(
            vertical: size.height * 0.07,
            horizontal: size.width * 0.13,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo REEMPLAZAR POR IMAGEN
                Container(
                  height: size.height * 0.25,
                  width: size.height * 0.25,
                  color: Colors.black26,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(
                  'BiciTrack',
                  style: textTheme.displayLarge,
                ),
                SizedBox(height: size.height * 0.04),
                // Formulario
                Form(
                  child: Column(
                    children: [
                      const FormInput(icon: Icons.person),
                      SizedBox(height: size.height * 0.03),
                      const FormInput(icon: Icons.key),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                // Boton iniciar sesion
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Iniciar sesión',
                    style: textTheme.labelLarge,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                // Boton iniciar sesion Google
                ElevatedButton(
                  onPressed: () {},
                  style: elevatedButtonTheme.style!.copyWith(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.google,
                        color: purple,
                        size: 30,
                      ),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        'Inicia sesión con Google',
                        style: textTheme.labelMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
