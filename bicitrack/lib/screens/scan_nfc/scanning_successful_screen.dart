import 'package:bicitrack/screens/bicycle_view.dart';
import 'package:flutter/material.dart';

class ScanningSuccessfulScreen extends StatelessWidget {
  final String serialNumber;
  const ScanningSuccessfulScreen({super.key, required this.serialNumber});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenSize.height * 0.1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Entrada Registrada',
                      style: textTheme.displayMedium,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                Container(
                  width: screenSize.height * 0.4,
                  height: screenSize.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white, // Color del círculo
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/check.png', // Ruta de la imagen, asegúrate de incluir la imagen en la carpeta de activos
                      width: screenSize.width * 0.5, // Tamaño de la imagen
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                SizedBox(
                  height: screenSize.height * 0.1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Registro realizado correctamente',
                      style: textTheme.displayMedium,
                      textAlign: TextAlign.center, // Alinear el texto al centro
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2BA84A),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BicycleScreen(
                                serialNumber: serialNumber,
                              );
                            }));
                          },
                          child: Text(
                            'Consultar',
                            style: textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF086375),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, '/ready_to_scan');
                          },
                          child: Text(
                            'Nuevo Registro',
                            style: textTheme.labelLarge,
                          ),
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
