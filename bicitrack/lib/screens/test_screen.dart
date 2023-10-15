import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final inputTheme = Theme.of(context).inputDecorationTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Titulo', style: textTheme.displayLarge),
              const SizedBox(
                height: 20,
              ),
              Text('Subtitulo', style: textTheme.displayMedium),
              const SizedBox(
                height: 20,
              ),
              Text('Texto normal', style: textTheme.displaySmall),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Boton Tipo 1',
                  style: textTheme.labelLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: elevatedButtonTheme.style!.copyWith(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  'Boton Tipo 2',
                  style: textTheme.labelLarge!.copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                height: 20,
              ),

              // Text input
              const Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 40,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Texto de prueba',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
