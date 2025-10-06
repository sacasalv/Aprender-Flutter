import 'dart:convert';

import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:http/http.dart' as http;

//Para importar la libreria para consumir una API debes ir a pubspec.yaml, añadir al nivel de flutter el nombre y la version
//En pub.dev/packages/http esta la doc

//Si va a ser para una version inferior de android 9.0, debes darle permisos en la carpeta /android/src/main/AndroidManifest.xml con la siguiente linea: 
//  <uses-permission android:name="android.permission.INTERNET" />

class Repository {
  Future<SuperheroResponse?> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse(
        "https://www.superheroapi.com/api.php/4c2a98bd3781620b2c755f59604b6916/search/$name",
      ),
    );

    if(response.statusCode == 200){
      var decodeJson = jsonDecode(response.body);
      SuperheroResponse superheroResponse = SuperheroResponse.fromJson(decodeJson);
      return superheroResponse;
    }else{
      return null; //para ponerlo a null debes poner la interrogacion en <SuperheroResponse?> ,asi , le dices que puede que llegue un objeto SuperheroResponse.
      // throw Exception("Ha ocurrido un error");
    }
  }
}
