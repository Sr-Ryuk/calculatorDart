import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Visor extends StatelessWidget {
  final String texto;
  const Visor(this.texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // Ocupar toda a largura
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(92, 92, 92, 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              texto,
              minFontSize: 20,
              maxFontSize: 80,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                fontSize: 80,
                color: Color.fromRGBO(194, 193, 193, 1),
              ),
            ),
          ),
        ),
        SizedBox(height: 10), // Adiciona um espaçamento de 10 pixels
      ],
    );
  }
}
