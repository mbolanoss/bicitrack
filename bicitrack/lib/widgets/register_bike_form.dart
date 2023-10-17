import 'package:bicitrack/models/bike.dart';
import 'package:bicitrack/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bike_owner.dart';
import '../providers/bike_register_provider.dart';
import '../utilities/custom_theme.dart';
import 'form_input.dart';

class RegisterBikeForm extends StatelessWidget {
  final BikeOwner owner;
  static var formKey = GlobalKey<FormState>();
  static final serialFieldController = TextEditingController();

  const RegisterBikeForm({
    super.key,
    required this.owner,
  });

  Future<void> handleRegister(BuildContext context) async {
    final firestoreService = FirestoreService();
    final bikeRegisterProvider = context.read<BikeRegisterProvider>();

    final bike = Bike(serialNumber: serialFieldController.text);

    try {
      // Registrar solo la bicicleta
      if (await firestoreService.checkOwnerExists(owner.idCard!)) {
        await firestoreService.registerBike(owner, bike);
      }
      // Registrar dueño y bicicleta
      else {
        await firestoreService.registerOwnerAndBike(
          owner,
          bike,
        );
      }

      // Subir fotos
      final ownerPhoto = bikeRegisterProvider.ownerPhotoFile;
      final bikePhoto = bikeRegisterProvider.bikePhotoFile;
      firestoreService.uploadPhoto(
        file: ownerPhoto!,
        folder: 'users_photos',
        name: '${owner.idCard!}',
      );
      firestoreService.uploadPhoto(
        file: bikePhoto!,
        folder: 'bikes_photos',
        name: '${owner.idCard!}-${bike.serialNumber}',
      );

      // ignore: use_build_context_synchronously
      showSuccessDialog(context);
    } on Exception {
      showErrorDialog(context);
    }
  }

  Future<dynamic> showErrorDialog(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: red,
          title: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text(
              'Error al registrar bicicleta',
              style: textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          content: Text(
            'Por favor contacte al administrador',
            style: textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  Future<dynamic> showSuccessDialog(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: green,
          title: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text(
              'Bicicleta registrada',
              style: textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          content: Text(
            'Se ha registrado la bicicleta con éxito',
            style: textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              style: elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                'Ok',
                style: textTheme.displaySmall,
              ),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese un número de serie';
              }
              return null;
            },
          ),
          SizedBox(height: screenSize.height * 0.05),
          // Boton continuar
          ElevatedButton(
            onPressed: () async {
              await handleRegister(context);
            },
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
