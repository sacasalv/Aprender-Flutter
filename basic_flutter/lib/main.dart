import 'package:basic_flutter/components/imagen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Esqueleto
      home: Scaffold(
        appBar: AppBar(
          title: Text("NAVBAR"),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white, //Color del texto
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.abc))
          ],
        ),
        backgroundColor: Colors.amber,
        body: ImagenExample(),
        floatingActionButton: FloatingActionButton(onPressed: (){}), //ya te coloca abajo el boton
      ),
    );
  }
}
