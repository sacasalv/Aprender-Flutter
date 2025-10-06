import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {

  final double valor;
  final Function(double) onHeightChanged;

  const HeightSelector({super.key, required this.valor, required this.onHeightChanged});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 170; //Altura inicial

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("Altura".toUpperCase(), style: TextStyles.bodyText),
            ),
            Text(
              "${widget.valor.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ), //Muestra el numero de decimales a ver toStringAsFixed
            Slider(
              value: widget.valor,
              onChanged: (value) {
                widget.onHeightChanged(value);
              },
              min: 150,
              max: 220,
              divisions: 70, //Son los saltos que puede dar
              label:
                  "${widget.valor.toStringAsFixed(0)} cm", //Muestra como una tooltip lo que estas seleccionando
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
