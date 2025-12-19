import 'package:flutter/material.dart';

class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({super.key});

  @override
  State<Ejercicio2> createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  final TextEditingController _distanciaController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _eficienciaController = TextEditingController();

  String _resultado = "";

  void _calcularCosto() {
    double distancia = double.tryParse(_distanciaController.text) ?? 0;
    double precio = double.tryParse(_precioController.text) ?? 0;
    double eficiencia = double.tryParse(_eficienciaController.text) ?? 0;

    if (eficiencia <= 0) {
      setState(() {
        _resultado = "Error: La eficiencia debe ser mayor a 0.";
      });
      return;
    }

    double litrosConsumidos = distancia / eficiencia;
    double costoTotal = litrosConsumidos * precio;

    setState(() {
      _resultado =
          "Costo Total: \$${costoTotal.toStringAsFixed(2)}\n"
          "(Litros: ${litrosConsumidos.toStringAsFixed(2)} L)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("Calculadora de Combustible"),
          TextField(
            controller: _distanciaController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Distancia del viaje (km)"),
          ),
          TextField(
            controller: _precioController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Precio por litro"),
          ),
          TextField(
            controller: _eficienciaController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Eficiencia (km por litro)",
              hintText: "Ej: 14",
            ),
          ),
          ElevatedButton(
            onPressed: _calcularCosto,
            child: const Text("Calcular Costo"),
          ),
          Text(_resultado),
        ],
      ),
    );
  }
}