import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_pratica/componentes/botao.dart';
import 'package:prova_pratica/componentes/textoVariacao.dart';

class PgMoedas extends StatefulWidget {
  const PgMoedas({super.key});

  @override
  State<PgMoedas> createState() => _PgMoedasState();
}

class _PgMoedasState extends State<PgMoedas> {

  dynamic _valorDolar = "";
  dynamic _valorEuro = "";
  dynamic _valorPeso = "";
  dynamic _valorYen = "";
  dynamic _variacaoDolar = "";
  dynamic _variacaoEuro = "";
  dynamic _variacaoPeso = "";
  dynamic _variacaoYen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finanças de Hoje"),
        backgroundColor: const Color.fromARGB(255, 10, 63, 11),
      ),
      body: _criaBody(),
    );
  }

  _buscarMoedas() async{
    const String urlHgFinancas = "https://api.hgbrasil.com/finance?format=json-cors&key=5c81598a";
    Response resposta = await get(Uri.parse(urlHgFinancas));
    Map cotacao = json.decode(resposta.body);
    setState(() {
      _valorDolar = cotacao["results"]["currencies"]["USD"]["buy"];
      _valorEuro = cotacao["results"]["currencies"]["EUR"]["buy"];
      _valorPeso = cotacao["results"]["currencies"]["ARS"]["buy"];
      _valorYen = cotacao["results"]["currencies"]["JPY"]["buy"];

      _variacaoDolar = cotacao["results"]["currencies"]["JPY"]["variation"];
      _variacaoEuro = cotacao["results"]["currencies"]["JPY"]["variation"];
      _variacaoPeso = cotacao["results"]["currencies"]["JPY"]["variation"];
      _variacaoYen = cotacao["results"]["currencies"]["JPY"]["variation"];
    });
  }

  _irAcoes() {
    Navigator.pushNamed(context, "/pgAcoes");
  }

  _criaBody() {
    _buscarMoedas();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Moedas"),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          const Text("Dólar"),
                          Row(
                            children: [
                              Text(_valorDolar.toString()),
                              TextoVariacao(variacao: _variacaoDolar)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Euro"),
                          Row(
                            children: [
                              Text(_valorEuro.toString()),
                              TextoVariacao(variacao: _variacaoEuro)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          const Text("Peso"),
                          Row(
                            children: [
                              Text(_valorPeso.toString()),
                              TextoVariacao(variacao: _variacaoPeso)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Yen"),
                          Row(
                            children: [
                              Text(_valorYen.toString()),
                              TextoVariacao(variacao: _variacaoYen)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Botao(
            texto: "ir para Ações",
            funcao: _irAcoes,
          )
        ],
      ),
    );
  }
}
