import 'package:flutter/material.dart';

class BicycleScreen extends StatelessWidget {
  const BicycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue.shade700,
              child: const Text('04 9C 64 D2 45 2B 80',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            )),
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
        ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              color: Colors.green.shade600,
              child: const Text('LP 44099790',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            )),
        const SizedBox(height: 36),
        const Text(
          'Propietario',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        // TODO: Turn into one component
        Container(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 12),
          child: Column(children: [
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  'Santiago Acosta Meza',
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.assignment_ind,
                  size: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  '100101019234',
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  size: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  '315 299 9847',
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.email_rounded,
                  size: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  'saacostam@mail.com',
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ]),
        )
      ]),
    );
  }
}
