import 'package:bicitrack/models/bike_owner.dart';
import 'package:bicitrack/services/bike_service.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:bicitrack/widgets/header.dart';
import 'package:bicitrack/widgets/header_pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EditBycicleView extends StatefulWidget{
  late String serialNumber;

  EditBycicleView({super.key, required this.serialNumber});

  @override
  State<EditBycicleView> createState() => _EditBicycleViewState(serialNumber);
}

class _EditBicycleViewState extends State<EditBycicleView> {
  late String serialNumber;
  _EditBicycleViewState(this.serialNumber);

  final firestoreService = BikeService();

  bool loading = true;
  bool updatingData = false;

  int? idCard;
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void initState(){
    super.initState();
    fetchInitialBikeInfo();
  }

  void fetchInitialBikeInfo() async {
    final bikeAndOwner = await firestoreService.getBikeAndOwnerBySerialNumber(serialNumber);
    final bikeOwner = bikeAndOwner.bikeOwner;

    setState(() {
      loading = false;
      ownerNameController.value = TextEditingValue(text: bikeOwner.name.toString());
      phoneController.value = TextEditingValue(text: bikeOwner.phoneNumber.toString());
      emailController.value = TextEditingValue(text: bikeOwner.email.toString());
      idCard = bikeOwner.idCard;
    });
  }

  void updateBikeInfo(BuildContext context) async {
    if (updatingData) return;

    updatingData = true;

    await firestoreService.updateBike(BikeOwner(
        name: ownerNameController.value.text,
        idCard: idCard,
        phoneNumber: int.parse(phoneController.value.text),
        email: emailController.value.text,
    ));

    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: green,
            title: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Text(
                'Información Actualizada',
                style: textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                style: elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  'Ok',
                  style: textTheme.displaySmall,
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        }
    );

    updatingData = false;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (loading) {
      return Scaffold(
        body: Center(
            child: LoadingAnimationWidget.waveDots(color: purple, size: 100)
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: HeaderPill(text: serialNumber),
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
                    child: Image(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/bicitrack-de168.appspot.com/o/bikes_photos%2F$idCard-$serialNumber?alt=media")),
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
                child: Column(
                  children: [
                    TextField(
                      controller: ownerNameController,
                      decoration: const InputDecoration(
                        hintText: 'Nombre',
                      ),
                    ),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'Celular',
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Correo Electrónico',
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    ElevatedButton(onPressed: () {updateBikeInfo(context);}, child: Text('Actualizar'))
                  ],
                )
            )
          ],
        )
      ]),
    );
  }
}