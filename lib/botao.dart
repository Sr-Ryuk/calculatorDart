import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  static const corPadrao = Color.fromRGBO(226, 224, 224, 1);
  static const corOperacao = Color.fromRGBO(22, 22, 22, 1);
  final String texto;
  final bool duplo;
  final Color cor;
  final void Function(String) callback;
  final Color corTexto;

  const Botao({
    Key? key,
    required this.texto,
    this.duplo = false,
    this.cor = corPadrao,
    required this.callback,
    this.corTexto = Colors.black,
  }) : super(key: key);

  const Botao.operacao({
    Key? key,
    required this.texto,
    this.duplo = false,
    this.cor = corOperacao,
    required this.callback,
    this.corTexto = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: duplo ? 2 : 1,
      child: Container(
        margin: EdgeInsets.all(4.0), // Ajuste o valor conforme necessário
        child: CupertinoButton(
          padding: EdgeInsets.all(16.0), // Ajuste o valor conforme necessário
          color: cor,
          onPressed: () => callback(texto),
          child: Text(
            texto,
            style: TextStyle(
              color: corTexto,
              fontSize: 24, // Ajuste o tamanho da fonte conforme necessário
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }
}
