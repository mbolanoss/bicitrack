import 'package:flutter/material.dart';

class HeaderPill extends StatelessWidget {
  final String text;

  const HeaderPill({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue.shade700,
          child: Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
