import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_pratica/componentes/botao.dart';
import 'package:prova_pratica/componentes/textoVariacao.dart';

class PgAcoes extends StatefulWidget {
  const PgAcoes({super.key});

  @override
  State<PgAcoes> createState() => _PgAcoesState();
}

class _PgAcoesState extends State<PgAcoes> {

  dynamic _ibovespa = "";
  dynamic _ifix = "";
  dynamic _nasdaq = "";
  dynamic _dowjones = "";
  dynamic _cac = "";
  dynamic _nikkei = "";
  dynamic _variacaoIbovespa = "";
  dynamic _variacaoIfix = "";
  dynamic _variacaoNasdaq = "";
  dynamic _variacaoDowjones = "";
  dynamic _variacaoCac = "";
  dynamic _variacaoNikkei = "";

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

  _buscarAcoes() async{
    const String urlHgFinancas = "https://api.hgbrasil.com/finance?format=json-cors&key=5c81598a";
    Response resposta = await get(Uri.parse(urlHgFinancas));
    Map cotacao = json.decode(resposta.body);
    setState(() {
      _ibovespa = cotacao["results"]["stocks"]["IBOVESPA"]["points"];
      _ifix = cotacao["results"]["stocks"]["IFIX"]["points"];
      _nasdaq = cotacao["results"]["stocks"]["NASDAQ"]["points"];
      _dowjones = cotacao["results"]["stocks"]["DOWJONES"]["points"];
      _cac = cotacao["results"]["stocks"]["CAC"]["points"];
      _nikkei = cotacao["results"]["stocks"]["NIKKEI"]["points"];

      _variacaoIbovespa = cotacao["results"]["stocks"]["IBOVESPA"]["variation"];
      _variacaoIfix = cotacao["results"]["stocks"]["IFIX"]["variation"];
      _variacaoNasdaq = cotacao["results"]["stocks"]["NASDAQ"]["variation"];
      _variacaoDowjones = cotacao["results"]["stocks"]["DOWJONES"]["variation"];
      _variacaoCac = cotacao["results"]["stocks"]["CAC"]["variation"];
      _variacaoNikkei = cotacao["results"]["stocks"]["NIKKEI"]["variation"];
    });
  }

  _irBitcoin() {
    Navigator.pushNamed(context, "/pgBitcoin");
  }

  _criaBody() {
    _buscarAcoes();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Ações"),
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
                          const Text("IBOVESPA"),
                          Row(
                            children: [
                              Text(_ibovespa.toString()),
                              TextoVariacao(variacao: _variacaoIbovespa)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("NASDAQ"),
                          Row(
                            children: [
                              Text(_nasdaq.toString()),
                              TextoVariacao(variacao: _variacaoNasdaq)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("CAC"),
                          Row(
                            children: [
                              Text(_cac.toString()),
                              TextoVariacao(variacao: _variacaoCac)
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
                          const Text("IFIX"),
                          Row(
                            children: [
                              Text(_ifix.toString()),
                              TextoVariacao(variacao: _variacaoIfix)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("DOWJONES"),
                          Row(
                            children: [
                              Text(_dowjones.toString()),
                              TextoVariacao(variacao: _variacaoDowjones)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("NIKKEI"),
                          Row(
                            children: [
                              Text(_nikkei.toString()),
                              TextoVariacao(variacao: _variacaoNikkei)
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Botao(
            texto: "ir para Bitcoin",
            funcao: _irBitcoin,
          )
        ],
      ),
    );
  }
}
