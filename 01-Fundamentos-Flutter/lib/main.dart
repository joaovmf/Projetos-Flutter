import 'package:flutter/material.dart';
import 'dart:developer';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState(){
    return FormularioTransferenciaState();
  }
  
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

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
          ElevatedButton(onPressed: () => _criaTransferencia(context),
            child: Text('confirmar'))
        ],
      ),
    );
  }
  void _criaTransferencia (BuildContext context) {
    final String numeroConta = _controladorCampoNumeroConta.text;
    final String valor = _controladorCampoValor.text;
    if (numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
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

class ListaTransferencia extends StatefulWidget {

final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(itemCount: widget._transferencias.length, itemBuilder: (context, indice) {
        final transferencia = widget._transferencias[indice];
        return ItemTransferencia(transferencia);
      },),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null){
              setState(() {
              widget._transferencias.add(transferenciaRecebida);
            });
            }
          });
        },
      ),
    );
  }
}




class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

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

class Transferencia {
  final String valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

pressedSimulation() {
  
}
