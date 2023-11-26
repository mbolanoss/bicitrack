import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:bicitrack/widgets/header.dart';
import 'package:bicitrack/widgets/header_pill.dart';
import 'package:bicitrack/widgets/owner_data.dart';
import 'package:flutter/material.dart';

class BicycleScreen extends StatelessWidget {
  const BicycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const HeaderPill(text: '04 9C 64 D2 45 2B 80'),
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
                    OwnerDataUnit(
                        icon: Icons.person, content: 'Santiago Acosta Meza'),
                    OwnerDataUnit(
                        icon: Icons.assignment_ind, content: '100101019234'),
                    OwnerDataUnit(icon: Icons.phone, content: '315 299 9847'),
                    OwnerDataUnit(
                        icon: Icons.email_rounded,
                        content: 'saacostam@mail.com'),
                  ],
                )),
          ],
        )
      ]),
    );
  }
}
