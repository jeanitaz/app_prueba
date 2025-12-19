import 'package:flutter/material.dart';

class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({super.key});

  @override
  State<Ejercicio1> createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  final TextEditingController _masaController = TextEditingController();
  final TextEditingController _velocidadController = TextEditingController();
  String _resultado = "";

  void _calcularEnergia() {
    double masa = double.tryParse(_masaController.text) ?? 0;
    double velocidad = double.tryParse(_velocidadController.text) ?? 0;

    if (velocidad == 0) {
      setState(() {
        _resultado = "Energía Cinética: 0 J";
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Atención"),
            content: const Text("El objeto está en reposo."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      double energia = 0.5 * masa * (velocidad * velocidad);
      setState(() {
        _resultado = "Energía: ${energia.toStringAsFixed(2)} J";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/pixel.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Cálculo de Energía Cinética",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _masaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Masa (kg)",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.fitness_center),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _velocidadController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Velocidad (m/s)",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.speed),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _calcularEnergia,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                      child: const Text("Calcular"),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _resultado,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
