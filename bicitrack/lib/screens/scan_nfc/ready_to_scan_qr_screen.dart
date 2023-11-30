import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ReadyToScanQRScreen extends StatefulWidget {
  const ReadyToScanQRScreen({Key? key}) : super(key: key);

  @override
  State<ReadyToScanQRScreen> createState() => _ReadyToScanQRScreenState();
}

class _ReadyToScanQRScreenState extends State<ReadyToScanQRScreen> {
  bool buttonsEnabled = true;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  void disableButtons() {
    setState(() {
      buttonsEnabled = false;
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
                  ),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.red,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: 300,
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
                          ? 'Acerca tu dispositivo al código QR'
                          : 'Escaneando código QR...',
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
                                  // Puedes realizar acciones adicionales según sea necesario
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
                                  // Puedes realizar acciones adicionales según sea necesario
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

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });

      // Aquí puedes realizar alguna acción con el resultado del escaneo (result).
      // Por ejemplo, mostrar un diálogo, navegar a otra pantalla, etc.
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
