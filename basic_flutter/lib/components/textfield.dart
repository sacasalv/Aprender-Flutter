import 'package:flutter/material.dart';

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView( //permite hacer scroll cuando la vista es mas pequeña y mas sencillo que usar Scroll
      children: [
        SizedBox(height: 60),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            maxLines: 3, //Limita a ver solo 3 lineas,
            maxLength: 10, //Limita los caracteres
            obscureText: true, //Ocultar la constraseña
            decoration: InputDecoration(
              hintText: "Introduce tu contraseña",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 32),
        TextField(),
        SizedBox(height: 32),
      ],
    );
  }
}
