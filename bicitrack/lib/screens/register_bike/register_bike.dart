import 'package:flutter/material.dart';

import '../../utilities/custom_theme.dart';
import '../../widgets/form_input.dart';

class RegisterBikeScreen extends StatelessWidget {
  const RegisterBikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cream,
          leading: IconButton(
            style: IconButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            icon: const Icon(Icons.keyboard_arrow_left_sharp),
            iconSize: 60,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // Margen de toda la pantalla
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.05,
              horizontal: screenSize.width * 0.13,
            ),
            child: Center(
              child: Column(
                children: [
                  // Titulo
                  Text(
                    'Registro de bicicleta',
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  // Foto de usuario
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Icon(
                        Icons.pedal_bike_rounded,
                        color: seablue,
                        size: screenSize.width * 0.5,
                      ),
                      // Boton añadir foto
                      ElevatedButton(
                        onPressed: () {},
                        style: elevatedButtonTheme.style!.copyWith(
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10),
                          ),
                        ),
                        child: const Icon(
                          Icons.add_a_photo,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  RegisterBikeForm(),
                  SizedBox(height: screenSize.height * 0.03),
                  // Boton cancelar
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    style: elevatedButtonTheme.style!.copyWith(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: Text(
                      'Cancelar',
                      style: textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                      ),
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

class RegisterBikeForm extends StatelessWidget {
  static var formKey = GlobalKey<FormState>();
  static final serialFieldController = TextEditingController();

  RegisterBikeForm({
    super.key,
  });

  // Future<void> handleLogin(BuildContext context) async {
  //   final textTheme = Theme.of(context).textTheme;
  //   try {
  //     await loginService.signInWithEmailAndPassword(
  //       email: emailFieldController.text,
  //       password: passFieldController.text,
  //     );
  //     emailFieldController.clear();
  //     passFieldController.clear();
  //   } on FirebaseAuthException {
  //     showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           backgroundColor: red,
  //           title: Container(
  //             padding: const EdgeInsets.all(15),
  //             decoration: const BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(20),
  //               ),
  //             ),
  //             child: Text(
  //               'Error al iniciar sesión',
  //               style: textTheme.displayMedium,
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //           content: Text(
  //             'Por favor ingrese correctamente sus credenciales',
  //             style: textTheme.displaySmall,
  //             textAlign: TextAlign.center,
  //           ),
  //         );
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Serial
          FormInput(
            controller: serialFieldController,
            icon: Icons.numbers,
            hint: 'Número de serie',
            isPass: false,
            validator: (value) {},
          ),
          SizedBox(height: screenSize.height * 0.05),
          // Boton continuar
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Registrar',
              style: textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
