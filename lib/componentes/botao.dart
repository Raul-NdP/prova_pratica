import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  
  final texto;
  final funcao;
  
  const Botao({super.key, this.texto = "Botão", this.funcao});

  @override
  State<Botao> createState() => _botaoState();
}

class _botaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 20
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 10, 63, 11),
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: const Size(200, 50),
        ),
        onPressed: widget.funcao, 
        child: Text(widget.texto)
      ),
    );
  }
}