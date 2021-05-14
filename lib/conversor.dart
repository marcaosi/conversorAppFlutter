import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  final _realController = TextEditingController();
  final _dollarController = TextEditingController();
  String _result = "";

  _clear() {
    _realController.clear();
    _dollarController.clear();
    setState(() {
      _result = "";
    });
  }

  _run() {
    if (_realController.text == "" || _dollarController.text == "") {
      return;
    }

    final real = double.parse(_realController.text);
    final dollar = double.parse(_dollarController.text);

    setState(() {
      _result =
          "Com R\$ $real você pode comprar ${(real / dollar).toStringAsFixed(2)} dólar(es).";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Real"),
              controller: _realController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Cotação do Dólar"),
              controller: _dollarController,
              keyboardType: TextInputType.number,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(onPressed: _clear, child: Text("Limpar")),
                  FlatButton(onPressed: _run, child: Text("Calcular"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(_result),
            )
          ],
        ),
      ),
    );
  }
}
