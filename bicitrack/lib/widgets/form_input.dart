import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final IconData icon;
  final String hint;

  const FormInput({
    super.key,
    required this.icon,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 40),
        const SizedBox(width: 10),
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
