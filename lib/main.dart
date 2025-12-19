import 'package:app_prueba/screens/ejercicio1.dart';
import 'package:app_prueba/screens/ejercicio2.dart';
import 'package:app_prueba/screens/ejercicio3.dart';
import 'package:app_prueba/screens/ejercicio4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantalla Principal',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Ejercicio1Screen(),
    );
  }
}

class Ejercicio1Screen extends StatefulWidget {
  const Ejercicio1Screen({super.key});

  @override
  State<Ejercicio1Screen> createState() => _Ejercicio1ScreenState();
}

class _Ejercicio1ScreenState extends State<Ejercicio1Screen> {
  int indice = 0;

  List<Widget> paginas = [
    const Ejercicio1(),
    const Ejercicio2(),
    const Ejercicio3(),
    const Ejercicio4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      indice = index;
    });
  }

  void _mostrarInformacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ejercicios", textAlign: TextAlign.center),
          content: const Text("Programador: Juan Paz\nCarrera: Software"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio ${indice + 1}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _mostrarInformacion(context),
          ),
        ],
      ),

      body: paginas[indice],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Ejer 1'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Ejer 2'),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Ejer 3',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Ejer 4'),
        ],
      ),
    );
  }
}
