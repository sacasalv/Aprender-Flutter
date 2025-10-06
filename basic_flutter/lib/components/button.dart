import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            print("Pulsado");
          },
          onLongPress: () { //Es cuando mantienes apretado el btn
            print("Pulsadoooo");
          },
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red)),
          child: const Text("Soy un boton"),
        ),
        OutlinedButton(onPressed: null, child: Text("Outliner")), //Solo muestra el bordel del btn y el texto, sin margin padding.
        TextButton(onPressed: null, child: Text("Text Button")), //Para poner una imagen
        FloatingActionButton(onPressed: () {}, child: Icon(Icons.add),), //Tipico boton que va abajo
        IconButton(onPressed: null, icon: Icon(Icons.favorite)),
        const Spacer(),
      ],
    );
  }
}
