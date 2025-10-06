import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      child: Column(
        //Centrar verticalmente
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        //Centrar orizontalmente
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Hola, soy santi"),
          Text("Hola, soy santi"),
          Text("Hola, soy santi"),
        ],
      ),
    );
  }
}
