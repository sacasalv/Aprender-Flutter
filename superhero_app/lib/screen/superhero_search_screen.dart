import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';
import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/screen/superhero_detail_screen.dart';

class SuperheroSearchScreen extends StatefulWidget {
  const SuperheroSearchScreen({super.key});

  @override
  State<SuperheroSearchScreen> createState() => _SuperheroSearchScreenState();
}

// RUTA API:  https://www.superheroapi.com/api.php/4c2a98bd3781620b2c755f59604b6916/1

class _SuperheroSearchScreenState extends State<SuperheroSearchScreen> {
  //late --> lo que hace es decirle que no se ha inicializado pero prometes que se va a inicializar antes de llamarlo
  // late Future<SuperheroResponse?> _superheroInfo;
  //Poner otra ? delante de <> es otra forma de hacerlo
  Future<SuperheroResponse?>? _superheroInfo;
  final Repository _repository = Repository();
  bool _isTextEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Superhero search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Busca un superhéroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _isTextEmpty = text.isEmpty;
                  _superheroInfo = _repository.fetchSuperheroInfo(text);
                });
              },
            ),
          ),
          /* 
          FutureBuilder:
          Es un widget que se encarga de escuchar un Future (una operación asíncrona que devolverá un valor en el futuro).
          Cuando el Future se completa, reconstruye la interfaz con el resultado.

          El builder se ejecuta cada vez que el Future cambia de estado.
          context --> le está dando la referencia de dónde se está construyendo ese pedacito de UI.
           */
          bodyList(_isTextEmpty),
        ],
      ),
    );
  }

  FutureBuilder<SuperheroResponse?> bodyList(bool isTextEmpty) {
    return FutureBuilder(
      future: _superheroInfo,
      builder: (context, snapshot) {
        if(_isTextEmpty) return Center(child: Text("Introduce un nombre"));
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          var superheroList = snapshot.data?.result;
          return Expanded(
            child: ListView.builder(
              itemCount: superheroList?.length ?? 0,
              itemBuilder: (context, index) {
                if (superheroList != null) {
                  return itemSuperhero(superheroList[index]);
                } else {
                  return Text("error");
                }
              },
            ),
          );
        } else {
          return Text("No hay resultados");
        }
      },
    );
  }

  Padding itemSuperhero(SuperheroDetailResponse item) => Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuperheroDetailScreen(superhero: item))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item.url,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.6),
              ),
            ), //fit --> para cambiar la forma de definir el tamaño
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.name, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300, color: Colors.white),),
            )
          ],
        ),
      ),
    ),
  );
}
