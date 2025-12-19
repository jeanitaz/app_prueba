import 'dart:convert';
import 'package:flutter/material.dart';

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Películas")),
      body: listar(context),
    );
  }
}

Future<List> leerLista(BuildContext context) async {
  final jsonString = await DefaultAssetBundle.of(
    context,
  ).loadString("assets/data/peliculas.json");

  return json.decode(jsonString)["peliculas"];
}

Widget listar(BuildContext context) {
  return FutureBuilder(
    future: leerLista(context),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data as List;

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];

            return ListTile(
              title: Text(item["titulo"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Año: ${item["anio"]}"),
                  Image.network(item["imagen"], width: 100, height: 150),
                ],
              ),
            );
          },
        );
      } else {
        return Text('No hay Texto');
      }
    },
  );
}
