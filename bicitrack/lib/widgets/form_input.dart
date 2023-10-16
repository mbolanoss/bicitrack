import 'package:bicitrack/screens/login_screen.dart';
import 'package:bicitrack/services/login_service.dart';
import 'package:bicitrack/utilities/custom_theme.dart';
import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  final IconData icon;
  final String hint;
  final bool isPass;
  final String? Function(String?) validator;
  final TextEditingController controller;

  const FormInput({
    super.key,
    required this.icon,
    required this.hint,
    required this.isPass,
    required this.validator,
    required this.controller,
  });

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  bool hasVisibilty = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon, size: 40),
        const SizedBox(width: 10),
        Flexible(
          child: TextFormField(
            controller: widget.controller,
            cursorColor: seablue,
            obscureText: hasVisibilty,
            decoration: InputDecoration(
              hintText: widget.hint,
              suffixIcon: widget.isPass
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          hasVisibilty = !hasVisibilty;
                        });
                      },
                      icon: Icon(hasVisibilty
                          ? Icons.visibility
                          : Icons.visibility_off),
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    )
                  : null,
            ),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
