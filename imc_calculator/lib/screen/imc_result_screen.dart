import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Sin el scaffold no hace la animacion tan fluida y al cambiar de vista muestra un fondo en blanco durante 1s
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedheight = height / 100;
    double imcResult = weight / (fixedheight * fixedheight);

    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tu resultado",
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                     getTitleByImc(imcResult),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByImc(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 66,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getDescripcionByImc(imcResult),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); //Para volver para atrás
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Finalizar", style: TextStyles.bodyText),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      //Nos pone una flecha para ir hacia atras, debido al navigator y al materialPageRoute
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
  
  Color getColorByImc(double imcResult) {
    
    return switch(imcResult){
      < 18.5 => Colors.blue, //IMC BAJO
      < 24.9 => Colors.green, //IMC NORMAL
      < 29.99 => Colors.orange, //Sobrepresp
      _ => Colors.red // _ --> significa cualquier cosa que sea mayor a los de arriba sera rojo //Obesidad
    };
  }

  String getTitleByImc(double imcResult){
    return switch(imcResult){
      < 18.5 => "IMC BAJO",
      < 24.9 => "IMC NORMAL",
      < 29.99 => "Sobrepresp",
      _ => "Obesidad" // _ --> significa cualquier cosa que sea mayor a los de arriba sera rojo //Obesidad
    };
  }

    String getDescripcionByImc(double imcResult){
    return switch(imcResult){
      < 18.5 => "Tu peso esta por debajo de lo recomendado",
      < 24.9 => "Tu peso esta en el rango saludable",
      < 29.99 => "Tienes sobrepeso, cuida tu alimentación",
      _ => "Tienes obesidad, consulta con un especialista" // _ --> significa cualquier cosa que sea mayor a los de arriba sera rojo //Obesidad
    };
  }
}
