import 'package:flutter/material.dart';

class TextoVariacao extends StatefulWidget {

  final variacao;

  const TextoVariacao({super.key, this.variacao});

  @override
  State<TextoVariacao> createState() => _TextoVariacaoState();
}

class _TextoVariacaoState extends State<TextoVariacao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: widget.variacao < 0 ? Colors.red : Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(widget.variacao.toString())
      ),
    );
  }
}