import 'package:flutter/material.dart';

import '../../models/bike_owner.dart';
import '../../utilities/custom_theme.dart';
import '../../widgets/register_bike_form.dart';

class RegisterBikeScreen extends StatelessWidget {
  final BikeOwner? owner;
  const RegisterBikeScreen({
    super.key,
    this.owner,
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
