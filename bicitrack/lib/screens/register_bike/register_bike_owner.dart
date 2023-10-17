import 'dart:typed_data';

import 'package:bicitrack/providers/bike_register_provider.dart';
import 'package:bicitrack/services/photo_taker.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/register_bike_owner_form.dart';

// ignore: must_be_immutable
class RegisterBikeOwnerScreen extends StatelessWidget {
  RegisterBikeOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cream,
          surfaceTintColor: Colors.transparent,
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
              vertical: screenSize.height * 0.01,
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
                  const OwnerPhoto(),
                  SizedBox(height: screenSize.height * 0.03),
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

class OwnerPhoto extends StatefulWidget {
  const OwnerPhoto({
    super.key,
  });

  @override
  State<OwnerPhoto> createState() => _OwnerPhotoState();
}

class _OwnerPhotoState extends State<OwnerPhoto> {
  Uint8List? file;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    final bikeRegisterProvider = context.watch<BikeRegisterProvider>();
    final ownerPhoto = bikeRegisterProvider.ownerPhotoFile;

    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ownerPhoto == null
            ? Icon(
                Icons.account_circle,
                color: seablue,
                size: screenSize.width * 0.4,
              )
            : Container(
                width: screenSize.width * 0.4,
                height: screenSize.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    image: MemoryImage(ownerPhoto),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
        // Boton añadir foto
        ElevatedButton(
          onPressed: () async {
            final photo = await PhotoTaker().takePhoto();
            if (photo != null) {
              bikeRegisterProvider.changeOwnerPhoto(photo);
            }
          },
          style: elevatedButtonTheme.style!.copyWith(
            shape: MaterialStateProperty.all(const CircleBorder()),
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
    );
  }
}
