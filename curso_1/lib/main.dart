import 'package:flutter/material.dart';
import 'dart:developer';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(controlador: _controladorCampoNumeroConta, dica: '0000', rotulo: 'Número da conta' ),
          Editor(controlador: _controladorCampoValor, dica: '0.00', rotulo: 'Valor', icone: Icons.monetization_on),
          ElevatedButton(onPressed: () => _criaTransferencia(),
            child: Text('confirmar'))
        ],
      ),
    );
  }
  void _criaTransferencia () {
    final String numeroConta = _controladorCampoNumeroConta.text;
    final String valor = _controladorCampoValor.text;
    if (numeroConta != null && valor != null){
      final transferenciaCriada = Transfererencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
    }
}
}

class Editor extends StatelessWidget {

  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.icone, this.controlador, this.rotulo, this.dica});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controlador,
              style: TextStyle(
              fontSize: 24.0,
            ),
            decoration:
                InputDecoration(icon: Icon(icone), labelText: rotulo , hintText: dica),
            keyboardType: TextInputType.number,
          ),   
          );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transfererencia('100.0', '1000')),
          ItemTransferencia(Transfererencia('200.0', '2000')),
          ItemTransferencia(Transfererencia('300.0', '3000')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: pressedSimulation(),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transfererencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(_transferencia.valor.toString()),
            subtitle: Text(_transferencia.numeroConta.toString()),
          ),
        ),
      ],
    );
  }
}

class Transfererencia {
  final String valor;
  final String numeroConta;

  Transfererencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transfererencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

pressedSimulation() {
  
}
