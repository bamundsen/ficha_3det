import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DadoTela extends StatefulWidget {
  const DadoTela({super.key});

  @override
  State<DadoTela> createState() => _DadoTelaState();
}

class _DadoTelaState extends State<DadoTela> {
  String image = 'lib/resources/d1.png';

  void rolarDado() {
    int rolagem = Random().nextInt(6) + 1;
    setState(() {
      switch (rolagem) {
        case 1:
          image = 'lib/resources/d1.png';
          break;
        case 2:
          image = 'lib/resources/d2.png';
          break;
        case 3:
          image = 'lib/resources/d3.png';
          break;
        case 4:
          image = 'lib/resources/d4.png';
          break;
        case 5:
          image = 'lib/resources/d5.png';
          break;
        case 6:
          image = 'lib/resources/d6.png';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text("Rolagem de Dado"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                width: 160,
                height: 160,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => rolarDado(),
                child: const Text(
                  "Rolar o dado!",
                  style: TextStyle(fontSize: 24),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
