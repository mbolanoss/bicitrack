import 'package:flutter/material.dart';

import '../models/bike_owner.dart';
import '../providers/bike_register_provider.dart';
import '../screens/register_bike/register_bike.dart';
import '../services/firestore_service.dart';
import '../utilities/custom_theme.dart';
import 'package:provider/provider.dart';
import 'form_input.dart';

class RegisterBikeOwnerForm extends StatelessWidget {
  static var formKey = GlobalKey<FormState>();
  static final nameFieldController = TextEditingController();
  static final idFieldController = TextEditingController();
  static final phoneFieldController = TextEditingController();
  static final emailFieldController = TextEditingController();
  final firestoreService = FirestoreService();

  RegisterBikeOwnerForm({
    super.key,
  });

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
      nameFieldController.text = selectedOwner.name!;
      idFieldController.text = '${selectedOwner.idCard!}';
      phoneFieldController.text = '${selectedOwner.phoneNumber!}';
      emailFieldController.text = selectedOwner.email!;
    }
  }

  void clearFields(BuildContext context) {
    formKey.currentState!.reset();

    final bikeRegisterProvider = context.read<BikeRegisterProvider>();
    bikeRegisterProvider.resetOwnerPhoto();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;
    final bikeRegisterProvider = context.read<BikeRegisterProvider>();

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
                  clearFields(context);
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
            controller: nameFieldController,
            inputType: TextInputType.name,
            icon: Icons.person,
            hint: 'Usuario',
            isPass: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese un nombre';
              }
              return null;
            },
          ),
          SizedBox(height: screenSize.height * 0.03),
          // Cedula
          FormInput(
            controller: idFieldController,
            inputType: TextInputType.number,
            icon: Icons.badge,
            hint: 'Cedula',
            isPass: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese una cédula';
              }
              return null;
            },
          ),
          SizedBox(height: screenSize.height * 0.03),
          // Telefono
          FormInput(
            controller: phoneFieldController,
            inputType: TextInputType.number,
            icon: Icons.phone,
            hint: 'Telefono',
            isPass: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese una teléfono';
              }
              return null;
            },
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
              return null;
            },
          ),
          SizedBox(height: screenSize.height * 0.03),
          // Boton continuar
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final owner = BikeOwner(
                  name: nameFieldController.text,
                  idCard: int.parse(idFieldController.text),
                  phoneNumber: int.parse(phoneFieldController.text),
                  email: emailFieldController.text,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterBikeScreen(
                      owner: owner,
                      ownerPhotoFile: bikeRegisterProvider.ownerPhotoFile,
                    ),
                  ),
                );
              }
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

  void handleOwner(BikeOwner owner, BuildContext context) async {
    final firestoreService = FirestoreService();
    final bikeRegisterProvider = context.read<BikeRegisterProvider>();

    final ownerPhoto = await firestoreService.downloadPhoto(
      folder: 'users_photos',
      name: '${owner.idCard}',
    );

    if (ownerPhoto != null) {
      bikeRegisterProvider.changeOwnerPhoto(ownerPhoto);
    }

    Navigator.of(context).pop(owner);
  }

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
                handleOwner(owners[index], context);
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
