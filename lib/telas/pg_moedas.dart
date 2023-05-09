import 'package:flutter/material.dart';

class PgMoedas extends StatefulWidget {
  const PgMoedas({super.key});

  @override
  State<PgMoedas> createState() => _PgMoedasState();
}

class _PgMoedasState extends State<PgMoedas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finanças de Hoje"),
        backgroundColor: Colors.green,
      ),
    );
  }
}