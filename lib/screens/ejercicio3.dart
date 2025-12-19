import 'package:flutter/material.dart';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final TextEditingController _profundidadController = TextEditingController();
  final TextEditingController _densidadController = TextEditingController();
  final TextEditingController _gravedadController = TextEditingController();

  String _resultado = "";

  void _calcularPresion() {
    double profundidad = double.tryParse(_profundidadController.text) ?? 0;
    double densidad = double.tryParse(_densidadController.text) ?? 0;
    double gravedad = double.tryParse(_gravedadController.text) ?? 0;

    if (profundidad < 0) {
      _mostrarAlertaError();
      setState(() {
        _resultado = "";
      });
      return;
    }

    double presion = densidad * gravedad * profundidad;
    setState(() {
      _resultado = "La Presión es: ${presion.toStringAsFixed(2)} Pascales";
    });
  }

  void _mostrarAlertaError() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error de Datos"),
          content: const Text("La profundidad no puede ser negativa."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Entendido"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("Cálculo de Presión Hidrostática"),
          TextField(
            controller: _profundidadController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Profundidad (h)"),
          ),
          TextField(
            controller: _densidadController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Densidad del fluido"),
          ),
          TextField(
            controller: _gravedadController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Gravedad"),
          ),
          ElevatedButton(
            onPressed: _calcularPresion,
            child: const Text("Calcular Presión"),
          ),
          Text(_resultado),
        ],
      ),
    );
  }
}