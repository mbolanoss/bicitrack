import 'package:flutter/material.dart';

class ReadyToScanScreen extends StatefulWidget {
  const ReadyToScanScreen({Key? key}) : super(key: key);

  @override
  State<ReadyToScanScreen> createState() => _ReadyToScanScreenState();
}

class _ReadyToScanScreenState extends State<ReadyToScanScreen> {
  bool buttonsEnabled = true;

  void disableButtons() {
    setState(() {
      buttonsEnabled = false;
    });

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/scanning_successful');
    });
  }

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
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      buttonsEnabled ? 'Listo para escanear!' : 'Escaneando...',
                      style: const TextStyle(
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
                      buttonsEnabled
                          ? 'assets/images/nfc.png'
                          : 'assets/images/loading.png',
                      width: screenSize.width * 0.6,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                SizedBox(
                  height: screenSize.height * 0.1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      buttonsEnabled
                          ? 'Acerca tu dispositivo a la etiqueta NFC'
                          : 'Escaneando etiqueta NFC...',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.1),
                SizedBox(
                  height: screenSize.height * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2BA84A),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: buttonsEnabled
                              ? () {
                                  disableButtons();
                                }
                              : null,
                          child: const Text(
                            'Entrada',
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF086375),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: buttonsEnabled
                              ? () {
                                  disableButtons();
                                }
                              : null,
                          child: const Text(
                            'Salida',
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
