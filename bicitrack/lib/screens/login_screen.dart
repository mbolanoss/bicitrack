import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/form_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // Margen de toda la pantalla
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.07,
              horizontal: screenSize.width * 0.1,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo REEMPLAZAR POR IMAGEN
                  Container(
                    height: screenSize.height * 0.25,
                    width: screenSize.height * 0.25,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.04,
                  ),
                  Text(
                    'BiciTrack',
                    style: textTheme.displayLarge,
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  // Formulario
                  Form(
                    child: Column(
                      children: [
                        // Usuario
                        FormInput(
                          icon: Icons.person,
                          hint: 'Usuario',
                          isPass: false,
                        ),
                        SizedBox(height: screenSize.height * 0.03),
                        // Contrasena
                        FormInput(
                          icon: Icons.key,
                          hint: 'Contraseña',
                          isPass: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.06),
                  // Boton iniciar sesion
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Iniciar sesión',
                      style: textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  // Boton iniciar sesion Google
                  ElevatedButton(
                    onPressed: () {},
                    style: elevatedButtonTheme.style!.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(12),
                      ),
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
                        SizedBox(width: screenSize.width * 0.03),
                        Text(
                          'Inicia sesión con Google',
                          style: textTheme.labelLarge!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
      ),
    );
  }
}
