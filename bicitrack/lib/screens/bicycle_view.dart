import 'package:bicitrack/screens/edit_bycicle_view.dart';
import 'package:bicitrack/services/bike_service.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:bicitrack/widgets/header.dart';
import 'package:bicitrack/widgets/header_pill.dart';
import 'package:bicitrack/widgets/owner_data.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BicycleScreen extends StatefulWidget {
  final String serialNumber;
  BicycleScreen({super.key, required this.serialNumber});

  @override
  State<BicycleScreen> createState() => _BicycleScreenState(serialNumber);
}

class _BicycleScreenState extends State<BicycleScreen> {
  _BicycleScreenState(this.serialNumber);

  final String serialNumber;
  final firestoreService = BikeService();

  bool loading = true;
  String name = "";
  String idCard = "";
  String phoneNumber = "";
  String email = "";
  BikeOwnerAndBike? bikeAndOwner;

  void initState() {
    super.initState();
    fetchBikeData(context);
  }

  void fetchBikeData(BuildContext context) async {
    try {
      bikeAndOwner =
          await firestoreService.getBikeAndOwnerBySerialNumber(serialNumber);
      final bikeOwner = bikeAndOwner!.bikeOwner;

      setState(() {
        loading = false;
        name = bikeOwner.name.toString();
        idCard = bikeOwner.idCard.toString();
        phoneNumber = bikeOwner.phoneNumber.toString();
        email = bikeOwner.email.toString();
      });
    } catch (e) {
      final textTheme = Theme.of(context).textTheme;
      showDialog(
          context: context,
          builder: (context) {
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
                  'Bicicleta no registrada!',
                  style: textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (Navigator.canPop(context)) Navigator.pop(context);
                    },
                    child: Text('Ok'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }
  }

  void redirectToEdit(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return EditBycicleView(serialNumber: serialNumber);
    }));
  }

  void handleDeletePressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          final textTheme = Theme.of(context).textTheme;
          final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

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
                'Eliminación',
                style: textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
            content: Text(
              '¿Esta seguro?',
              style: textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    await firestoreService.deleteBike(serialNumber);
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (context) {
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
                                'Error: Registro no eliminado',
                                style: textTheme.displayMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    if (Navigator.canPop(context))
                                      Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                          );
                        });
                  }

                  Navigator.pop(context);
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
                style: elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  'Seguro',
                  style: textTheme.displaySmall,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  'Cancelar',
                  style: textTheme.displaySmall,
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (loading) {
      return Scaffold(
        body: Center(
            child: LoadingAnimationWidget.waveDots(color: purple, size: 100)),
      );
    }

    const commonButtonStyling = ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        shadowColor: MaterialStatePropertyAll(Colors.transparent),
        surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        iconColor: MaterialStatePropertyAll(Colors.black),
        textStyle: MaterialStatePropertyAll(TextStyle(
          color: Colors.black,
        )));

    return Scaffold(
      appBar: AppBar(
        title: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: HeaderPill(text: serialNumber),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  redirectToEdit(context);
                },
                style: commonButtonStyling,
                child: const Icon(Icons.edit)),
            ElevatedButton(
                onPressed: () {
                  handleDeletePressed(context);
                },
                style: commonButtonStyling,
                child: const Icon(Icons.delete)),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: screenSize.height * 0.03),
            Center(
                child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 216,
                width: 216,
                color: purple,
                child: Image(
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/bicitrack-de168.appspot.com/o/bikes_photos%2F$idCard-$serialNumber?alt=media")),
              ),
            )),
            SizedBox(height: screenSize.height * 0.03),
            const Header(text: 'Propietario'),
            SizedBox(height: screenSize.height * 0.03),
            Container(
                margin: EdgeInsets.fromLTRB(
                    screenSize.width * 0.06,
                    screenSize.height * 0.02,
                    screenSize.width * 0.06,
                    screenSize.height * 0.02),
                child: OwnerData(
                  isEditMode: false,
                  data: [
                    OwnerDataUnit(icon: Icons.person, content: name),
                    OwnerDataUnit(icon: Icons.assignment_ind, content: idCard),
                    OwnerDataUnit(icon: Icons.phone, content: phoneNumber),
                    OwnerDataUnit(icon: Icons.email_rounded, content: email),
                  ],
                )),
          ],
        )
      ]),
    );
  }
}
