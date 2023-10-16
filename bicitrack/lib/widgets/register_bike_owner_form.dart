import 'package:flutter/material.dart';

import '../models/bike_owner.dart';
import '../services/firestore_service.dart';
import '../utilities/custom_theme.dart';
import 'form_input.dart';

class RegisterBikeOwnerForm extends StatelessWidget {
  static var formKey = GlobalKey<FormState>();
  static final userFieldController = TextEditingController();
  static final idFieldController = TextEditingController();
  static final phoneFieldController = TextEditingController();
  static final emailFieldController = TextEditingController();
  final firestoreService = FirestoreService();

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

  Future<void> handleLoadOwner(BuildContext context) async {
    final ownersList = await firestoreService.getAllBikeOwners();
    // ignore: use_build_context_synchronously
    final selectedOwner = await showDialog<BikeOwner>(
      context: context,
      builder: (_) {
        return OwnersDialog(owners: ownersList);
      },
    );
    if (selectedOwner != null) {
      userFieldController.text = selectedOwner.name!;
      idFieldController.text = '${selectedOwner.idCard!}';
      phoneFieldController.text = '${selectedOwner.phoneNumber!}';
      emailFieldController.text = selectedOwner.email!;
    }
  }

  void clearFields() {
    formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cargar dueño
              ElevatedButton(
                onPressed: () async {
                  await handleLoadOwner(context);
                },
                style: elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(purple),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
                  ),
                ),
                child: Text(
                  'Cargar dueño',
                  style: textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              // Resetear campos
              ElevatedButton(
                onPressed: () {
                  clearFields();
                },
                style: elevatedButtonTheme.style!.copyWith(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  backgroundColor: MaterialStateProperty.all(purple),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
                  ),
                ),
                child: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ],
          ),
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
          SizedBox(height: screenSize.height * 0.03),
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

class OwnersDialog extends StatelessWidget {
  final List<BikeOwner> owners;
  const OwnersDialog({
    super.key,
    required this.owners,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Text(
        'Dueños registrados',
        style: textTheme.displayMedium,
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: owners.length,
          separatorBuilder: (_, __) {
            return const Divider(
              color: Colors.black54,
              thickness: 3,
            );
          },
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(owners[index]);
              },
              child: ListTile(
                title: Text(
                  owners[index].name!,
                  style: textTheme.displaySmall,
                  textAlign: TextAlign.start,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
