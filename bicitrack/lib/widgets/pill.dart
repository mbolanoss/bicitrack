import 'package:flutter/material.dart';

class Pill extends StatelessWidget {
  final String text;

  const Pill({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
          color: Colors.green.shade600,
          child: Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
