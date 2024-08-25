import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'componentes/visor.dart';
import 'componentes/teclado.dart';
import 'modelos/memoria.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculatoraState();
}

class _CalculatoraState extends State<Calculadora> {
  final Memoria memoria = Memoria();

  _pressionado(String comando) {
    setState(() {
      memoria.tratarDigito(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Remova ou comente esta linha se quiser exibir a faixa de debug
      home: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Visor(memoria.valorNoVisor),
            const SizedBox(height: 2),
            Teclado(_pressionado),
          ],
        ),
      ),
    );
  }
}
