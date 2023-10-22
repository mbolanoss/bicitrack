import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../models/bike_owner.dart';
import '../../providers/bike_register_provider.dart';
import '../../services/photo_taker.dart';
import '../../utilities/custom_theme.dart';
import '../../widgets/register_bike_form.dart';
import 'package:provider/provider.dart';

class RegisterBikeScreen extends StatelessWidget {
  final BikeOwner? owner;
  final Uint8List? ownerPhotoFile;

  const RegisterBikeScreen({
    super.key,
    this.owner,
    this.ownerPhotoFile,
  });

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
                  // Foto de la bicicleta
                  const BikePhoto(),
                  SizedBox(height: screenSize.height * 0.01),
                  RegisterBikeForm(
                    owner: owner!,
                  ),
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

class BikePhoto extends StatelessWidget {
  const BikePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    final bikeRegisterProvider = context.watch<BikeRegisterProvider>();
    final bikePhoto = bikeRegisterProvider.bikePhotoFile;

    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        bikePhoto == null
            ? Icon(
                Icons.pedal_bike_rounded,
                color: seablue,
                size: screenSize.width * 0.4,
              )
            : Container(
                width: screenSize.width * 0.4,
                height: screenSize.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    image: MemoryImage(bikePhoto),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
        // Boton añadir foto
        ElevatedButton(
          onPressed: () async {
            final photo = await PhotoTaker().takePhoto();
            if (photo != null) {
              bikeRegisterProvider.changeBikePhoto(photo);
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
