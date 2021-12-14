import 'package:flutter/material.dart';
import 'package:gerenciamento_estado/components/editor.dart';
import 'package:provider/provider.dart';
import '../models/balance.dart';

const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';

class FormDeposit extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              controlador: _controladorCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text('confirmar'),
              onPressed: () => _createTransfer(context),
              style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green.shade900),
                  ),
            )
          ],
        ),
      ),
    );
  }

  _createTransfer(context) {
    final double value = double.tryParse(_controladorCampoValor.text) as double;
    final depositoValido = _validateDeposit(value);

    if(depositoValido) {
      _updateState(context, value);
      Navigator.pop(context);
    } else {
      print('ta nulo');
    }
  }

  _validateDeposit (value) {
    final _campoPreenchido = value != null;
    return _campoPreenchido;
  }

  _updateState (context, value) {
    Provider.of<Balance>(context, listen:false).add(value);
  }
}
