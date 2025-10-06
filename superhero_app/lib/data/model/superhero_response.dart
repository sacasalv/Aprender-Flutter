import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroResponse {
  final String response;
  final List<SuperheroDetailResponse> result;

  SuperheroResponse({required this.response, required this.result});

  /* 
  factory: constructor especial que decide cómo crear el objeto.
  Usos: 
    Quieres devolver una instancia existente (patrón singleton, caché, etc.).
    Quieres devolver una subclase en lugar de la clase original.
    Quieres hacer lógica extra antes de construir el objeto.
   */

  /*
    Map = un diccionario/objeto clave-valor en Dart.
    String = el tipo de las claves (las llaves del JSON son cadenas).
    dynamic = el tipo de los valores, que puede ser cualquiera (string, number, bool, lista, otro mapa…). 
  */
  factory SuperheroResponse.fromJson(Map<String, dynamic> json) {
    var list = json["results"] as List; //Castea a una lista
    List<SuperheroDetailResponse> heroList = list
        .map((hero) => SuperheroDetailResponse.fromJson(hero))
        .toList();

    return SuperheroResponse(response: json["response"], result: heroList);
  }
}
