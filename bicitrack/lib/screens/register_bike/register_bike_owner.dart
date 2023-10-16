import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';

import '../../widgets/form_input.dart';

class RegisterBikeOwnerScreen extends StatelessWidget {
  const RegisterBikeOwnerScreen({super.key});

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
              Navigator.of(context).pushReplacementNamed('/');
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
                    'Datos del dueño',
                    style: textTheme.displayMedium,
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  // Foto de usuario
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: seablue,
                        size: screenSize.width * 0.4,
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
                  // Formulario
                  RegisterBikeOwnerForm(),

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

class RegisterBikeOwnerForm extends StatelessWidget {
  static var formKey = GlobalKey<FormState>();
  static final userFieldController = TextEditingController();
  static final idFieldController = TextEditingController();
  static final phoneFieldController = TextEditingController();
  static final emailFieldController = TextEditingController();

  RegisterBikeOwnerForm({
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
          // Usuario
          FormInput(
            controller: userFieldController,
            inputType: TextInputType.name,
            icon: Icons.person,
            hint: 'Usuario',
            isPass: false,
            validator: (value) {},
          ),
          SizedBox(height: screenSize.height * 0.03),
          // Cedula
          FormInput(
            controller: idFieldController,
            inputType: TextInputType.number,
            icon: Icons.badge,
            hint: 'Cedula',
            isPass: false,
            validator: (value) {},
          ),
          SizedBox(height: screenSize.height * 0.03),
          // Telefono
          FormInput(
            controller: phoneFieldController,
            inputType: TextInputType.number,
            icon: Icons.phone,
            hint: 'Telefono',
            isPass: false,
            validator: (value) {},
          ),
          SizedBox(height: screenSize.height * 0.03),
          // Email
          FormInput(
            controller: emailFieldController,
            icon: Icons.email,
            hint: 'Correo electrónico',
            isPass: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese un correo electrónico';
              }
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value);
              if (!emailValid) {
                return 'Correo electrónico inválido';
              }
            },
          ),
          SizedBox(height: screenSize.height * 0.05),
          // Boton continuar
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register_bike');
            },
            child: Text(
              'Continuar',
              style: textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
