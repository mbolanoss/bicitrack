import 'package:flutter/material.dart';

class RegisterBike extends StatelessWidget {
  const RegisterBike({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // Margen de toda la pantalla
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.07,
              horizontal: screenSize.width * 0.1,
            ),
          ),
        ),
      ),
    );
  }
}
