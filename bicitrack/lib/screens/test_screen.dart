import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return SafeArea(
        child: Scaffold(
      body: Center(
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
          ],
        ),
      ),
    ));
  }
}
