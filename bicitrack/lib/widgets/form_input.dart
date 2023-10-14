import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final IconData icon;

  const FormInput({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 40),
        const SizedBox(width: 10),
        const Flexible(
          child: TextField(),
        ),
      ],
    );
  }
}
