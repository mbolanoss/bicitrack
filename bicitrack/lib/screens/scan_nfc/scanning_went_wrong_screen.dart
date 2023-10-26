import 'package:flutter/material.dart';

class ScanningWentWrongScreen extends StatelessWidget {
  const ScanningWentWrongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Algo Salió Mal',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                Container(
                  width: screenSize.height * 0.4,
                  height: screenSize.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/wrong.png',
                      width: screenSize.width * 0.5,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                SizedBox(
                  height: screenSize.height * 0.15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF52154E)
                          .withOpacity(0.9), // Fondo un poco más claro
                      borderRadius:
                          BorderRadius.circular(10.0), // Redondear los bordes
                      border: Border.all(
                        color: const Color(0xFF52154E), // Color del borde
                        width: 3.0,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'La etiqueta escaneada no se encuentra registrada en el sistema',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign:
                            TextAlign.center, // Alineación de texto centrada
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.1),
                SizedBox(
                  height: screenSize.height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2BA84A),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Intentar de nuevo',
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
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
