import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screen/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  //La diferencia entre stateless y stateful es que stl --> es estático(no varia) y stf --> maneja estados y es dinamico

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

//El guion bajo significa que es un fichero privado, solo es para este archivo
class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 80;
  double selectedHeight = 172;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          valor: selectedHeight,
          onHeightChanged: (nuevoValor) {
            setState(() {
              selectedHeight = nuevoValor;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "Peso",
                  valor: selectedWeight,
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "Edad",
                  valor: selectedAge,
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImcResultScreen(height: selectedHeight, weight: selectedWeight,)),
                );
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calcular", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
