import 'dart:math';

class Memoria {
  static const operacoes = ['^', '!', '/', '*', '-', '+', '='];

  _estaSubstituindoOperacao(String comando) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(comando) &&
        _ultimoComando != '=' &&
        comando != '=';
  }

  _limpar() {
    _valor = '0';
    _buffer.setAll(0, [0.0, '', 0.0]);

    _limparVisor = false;
    _ehPrimeiroNumero = true;
    _ultimoComando = '';
  }

  _setOperacao(String novaOperacao) {
    bool ehSinalDeIgual = novaOperacao == '=';
    if (_ehPrimeiroNumero) {
      if (!ehSinalDeIgual) {
        _ehPrimeiroNumero = false;
        _buffer[1] = novaOperacao;
      }
      _limparVisor = true;
    } else {
      _buffer[0] = _computa();
      _buffer[1] = ehSinalDeIgual ? '' : novaOperacao;
      _buffer[2] = 0.0;

      // Arredondando para 1 casa decimal
      _valor = (_buffer[0] as double).toStringAsFixed(1);
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;

      _ehPrimeiroNumero = ehSinalDeIgual;
      _limparVisor = !ehSinalDeIgual;
    }
  }

  num potencia(double base, double expoente) {
    return pow(base, expoente);
  }

  int fatorial(int numero) {
    int resultado = 1;
    for (int i = numero; i >= 1; i--) {
      resultado *= i;
    }
    return resultado;
  }

  double _computa() {
    final primeiroNumero = _buffer[0] as double;
    final segundoNumero = _buffer[2] as double;
    double resultado;

    switch (_buffer[1]) {
      case '^':
        resultado = potencia(primeiroNumero, segundoNumero).toDouble();
        break;
      case '!':
        resultado = fatorial(primeiroNumero.toInt()).toDouble();
        break;
      case '/':
        resultado = primeiroNumero / segundoNumero;
        break;
      case '*':
        resultado = primeiroNumero * segundoNumero;
        break;
      case '-':
        resultado = primeiroNumero - segundoNumero;
        break;
      case '+':
        resultado = primeiroNumero + segundoNumero;
        break;
      default:
        resultado = primeiroNumero;
    }

    // Arredondar o resultado para 1 casa decimal
    return double.parse(resultado.toStringAsFixed(1));
  }

  _adicionarDigito(String digito) {
    final ehPonto = digito == '.';
    final deveLimparValor = (_valor == '0' && !ehPonto) || _limparVisor;
    if (ehPonto && _valor.contains('.') && !deveLimparValor) {
      return;
    }
    final valorVazio = ehPonto ? '0' : '';
    final valorAtual = deveLimparValor ? valorVazio : _valor;
    _valor = valorAtual + digito;
    _limparVisor = false;
    _buffer[_ehPrimeiroNumero ? 0 : 2] = double.tryParse(_valor) ?? 0;
  }

  void tratarDigito(String comando) {
    if (_estaSubstituindoOperacao(comando)) {
      _buffer[1] = comando;
      return;
    }

    if (comando == 'C') {
      _limpar();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _adicionarDigito(comando);
    }

    _ultimoComando = comando;
  }

  final _buffer = [0.0, '', 0.0];
  bool _ehPrimeiroNumero = true;
  bool _limparVisor = false;
  String _valor = '0';
  String _ultimoComando = '';

  String get valorNoVisor {
    if (_buffer[1] == '') {
      return _buffer.first.toString();
    } else if (operacoes.contains(_ultimoComando)) {
      return _buffer.sublist(0, 2).join(" ");
    } else {
      return _buffer.join(" ");
    }
  }
}
