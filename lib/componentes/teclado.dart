import 'package:flutter/material.dart';
import '../botao.dart';
import '../linha_botoes.dart';

class Teclado extends StatelessWidget {
  final void Function(String) callback;
  const Teclado(this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(92, 92, 92, 1),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SizedBox(
          height: 430,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 2),
              LinhaBotoes([
                Botao.operacao(texto: 'C', callback: callback),
                Botao.operacao(texto: '^', callback: callback),
                Botao.operacao(texto: '!', callback: callback),
                Botao.operacao(texto: '/', callback: callback),
              ]),
              const SizedBox(height: 2),
              LinhaBotoes([
                Botao(texto: '7', callback: callback),
                Botao(texto: '8', callback: callback),
                Botao(texto: '9', callback: callback),
                Botao.operacao(texto: '*', callback: callback),
              ]),
              const SizedBox(height: 2),
              LinhaBotoes([
                Botao(texto: '4', callback: callback),
                Botao(texto: '5', callback: callback),
                Botao(texto: '6', callback: callback),
                Botao.operacao(texto: '-', callback: callback),
              ]),
              const SizedBox(height: 2),
              LinhaBotoes([
                Botao(texto: '1', callback: callback),
                Botao(texto: '2', callback: callback),
                Botao(texto: '3', callback: callback),
                Botao.operacao(texto: '+', callback: callback),
              ]),
              const SizedBox(height: 2),
              LinhaBotoes([
                Botao(texto: '0', callback: callback),
                Botao(texto: '00', callback: callback),
                Botao(texto: '.', callback: callback),
                Botao.operacao(texto: '=', callback: callback),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
