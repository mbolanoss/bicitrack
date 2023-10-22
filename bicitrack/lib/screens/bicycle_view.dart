import 'package:bicitrack/widgets/header.dart';
import 'package:bicitrack/widgets/header_pill.dart';
import 'package:bicitrack/widgets/owner_data.dart';
import 'package:bicitrack/widgets/pill.dart';
import 'package:flutter/material.dart';

class BicycleScreen extends StatelessWidget {
  const BicycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderPill(text: '04 9C 64 D2 45 2B 80'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        const SizedBox(height: 24),
        Center(
            child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Container(
            height: 216,
            width: 216,
            color: Colors.deepOrange.shade500,
          ),
        )),
        const SizedBox(height: 16),
        const Pill(text: 'LP 44099790'),
        const SizedBox(height: 36),
        const Header(text: 'Propietario'),
        const SizedBox(height: 12),
        Container(
            margin: const EdgeInsets.fromLTRB(32, 12, 32, 12),
            child: const OwnerData(
              data: [
                OwnerDataUnit(
                    icon: Icons.person, content: 'Santiago Acosta Meza'),
                OwnerDataUnit(
                    icon: Icons.assignment_ind, content: '100101019234'),
                OwnerDataUnit(icon: Icons.phone, content: '315 299 9847'),
                OwnerDataUnit(
                    icon: Icons.email_rounded, content: 'saacostam@mail.com'),
              ],
            )),
      ]),
    );
  }
}
