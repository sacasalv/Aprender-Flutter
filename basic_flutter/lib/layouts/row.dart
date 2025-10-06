import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  const RowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: double.infinity,
        child: const Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer(), coge el espacio sobrante
            Text("Ejemplo 1"),
            // Spacer(),
            Expanded(child: Text("Ejemplo 1")), //Expanded ocupada todo el espacio sobrante
            Text("Ejemplo 1"),
          ],
        ),
      ),
    );
  }
}