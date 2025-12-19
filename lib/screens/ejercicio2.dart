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
          "Costo Total del Viaje: \$${costoTotal.toStringAsFixed(2)}\n"
          "(Litros consumidos: ${litrosConsumidos.toStringAsFixed(2)} L)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Calculadora de Combustible",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),

          TextField(
            controller: _distanciaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Distancia del viaje (km)",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),

          TextField(
            controller: _precioController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Precio por litro",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),

          TextField(
            controller: _eficienciaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Eficiencia (km por litro)",
              hintText: "Ej: 14",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 30),

          ElevatedButton.icon(
            onPressed: _calcularCosto,
            icon: Icon(Icons.calculate),
            label: Text("Calcular Costo"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),

          SizedBox(height: 30),

          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
            ),
            child: Text(
              _resultado.isEmpty ? "Esperando datos..." : _resultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _resultado.startsWith("Error")
                    ? Colors.red
                    : Colors.blue[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
