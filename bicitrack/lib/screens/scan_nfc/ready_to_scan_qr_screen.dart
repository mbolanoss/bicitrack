import 'package:bicitrack/models/bike.dart';
import 'package:bicitrack/services/bike_service.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ReadyToScanQRScreen extends StatefulWidget {
  const ReadyToScanQRScreen({Key? key}) : super(key: key);

  @override
  State<ReadyToScanQRScreen> createState() => _ReadyToScanQRScreenState();
}

class _ReadyToScanQRScreenState extends State<ReadyToScanQRScreen> {
  bool buttonsEnabled = true;
  bool scanningEnabled = false;
  bool processingScan = false;
  late String typeOfScan;
  final firestoreService = BikeService();

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;

  void disableButtons() {
    setState(() {
      buttonsEnabled = false;
      scanningEnabled = true;
    });
  }

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
                      buttonsEnabled ? 'Listo para escanear!' : 'Escaneando...',
                      style: textTheme.displayMedium,
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                Container(
                  width: screenSize.height * 0.4,
                  height: screenSize.height * 0.4,
                  decoration: const BoxDecoration(
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
                      style: textTheme.displayMedium,
                      textAlign: TextAlign.center,
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
                                  typeOfScan = 'enter';
                                }
                              : null,
                          child: Text(
                            'Entrada',
                            style: textTheme.labelLarge,
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
                                  typeOfScan = 'exit';
                                }
                              : null,
                          child: Text(
                            'Salida',
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

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) async {
      if (scanningEnabled && !processingScan) {
        setState(() {
          result = scanData;
          processingScan = true;
        });

        try {
          final Bike bike =
              await firestoreService.registerInOrOut(result!.code!, typeOfScan);
          Future.microtask(() {
            controller.dispose();
            Navigator.popAndPushNamed(context, '/scanning_successful',
                arguments: bike.serialNumber);
          });
        } catch (e) {
          Future.microtask(() {
            controller.dispose();
            Navigator.popAndPushNamed(context, '/scanning_went_wrong');
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
