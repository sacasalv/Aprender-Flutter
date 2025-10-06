import 'package:flutter/material.dart';

class ImagenExample extends StatelessWidget {
  const ImagenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "https://avatars.githubusercontent.com/u/16361358?v=4",
        ), //Sino sale nada recargar
        Image.asset("assets/images/dash.jpeg", height: 100,)
        // Para poner una imagen en local debes configurar el pubsec.yaml y indicarle el directorio donde esta es decir algo asií
        /* 
          flutter:
            uses-material-design: true (ESTO NO HACE FALTA PONERLO YA VIENE EN EL ARCHIVO)
            assets:
              - assets/images/
         */
        
      ],
    );
  }
}
