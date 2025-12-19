import 'package:app_prueba/screens/ejercicio1.dart';
import 'package:app_prueba/screens/ejercicio2.dart';
import 'package:app_prueba/screens/ejercicio3.dart';
import 'package:app_prueba/screens/ejercicio4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Evaluacion());
}

class Evaluacion extends StatelessWidget {
  const Evaluacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Cuerpo());
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> paginas = [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/pixel.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const Ejercicio1(),
      const Ejercicio2(),
      const Ejercicio3(),
      const Ejercicio4(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicios"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _mostrarInfo(context),
          ),
        ],
      ),
      body: paginas[indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indice,
        onTap: (value) {
          setState(() {
            indice = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Ej 1',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Ej 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Ej 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Ej 4',
          ),
        ],
      ),
    );
  }
}

void _mostrarInfo(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Titulo :Ejercicios de Programación "),
      content: Column(
        children: [
          Text("Programador: Christopher  Chasiloa"),
          Text("Carrera: Desarrollo de Software"),
        ],
      ),
    ),
  );
}
