import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  String _language = "es";
  double _fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text("Modo oscuro"),
          value: _darkMode,
          onChanged: (darkMode) {
            // setState(() {
            //   _darkMode = darkMode;
            // });

            setState(() => _darkMode = darkMode);
          },
        ),
        DropdownButtonFormField(
          value: _language,
          items: [
            DropdownMenuItem(value: "es", child: Text("Español")),
            DropdownMenuItem(value: "en", child: Text("Ingles")),
            DropdownMenuItem(value: " ch", child: Text("Chino")),
          ],
          onChanged: (language) {
            if (language != null) {
              setState(() => _language = language);
            }
          },
        ),
      ],
    );
  }
}
