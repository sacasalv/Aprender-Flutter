import 'package:flutter/material.dart';
import 'package:settings_app/preferences_keys.dart';
import 'package:settings_app/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Se encarga de que todo ha sido inicializado para hacer preferences
 final prefs = await SharedPreferences.getInstance();
 bool darkMode = prefs.getBool(PreferencesKeys.darkMode) ?? false;
  runApp(MainApp(isDarkMode: darkMode,));
}

class MainApp extends StatelessWidget {
  final bool isDarkMode;

  const MainApp({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(), //Opciones para hacer esto de forma dinamica 1.Moverlo a settings_screen 2. Hacerlo con Future Builder 3. Hacerlo antes de que se llame al MainApp(no muy recomendablle)
      home: Scaffold( 
        appBar: AppBar( title: Text("Configuracion"),),
        body: SettingsScreen(),
      ),
    );
  }
}
