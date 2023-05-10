import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_pratica/componentes/botao.dart';
import 'package:prova_pratica/componentes/textoVariacao.dart';

class PgBitcoin extends StatefulWidget {
  const PgBitcoin({super.key});

  @override
  State<PgBitcoin> createState() => _PgBitcoinState();
}

class _PgBitcoinState extends State<PgBitcoin> {

  dynamic _blockchainInfo = "";
  dynamic _bitStamp = "";
  dynamic _mercadoBitcoin = "";
  dynamic _coinBase = "";
  dynamic _foxBIt = "";
  
  dynamic _variacaoBlockchainInfo = "";
  dynamic _variacaoBitStamp = "";
  dynamic _variacaoMercadoBitcoin = "";
  dynamic _variacaoCoinBase = "";
  dynamic _variacaoFoxBIt = "";

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

  _buscarBitcoin() async{
    const String urlHgFinancas = "https://api.hgbrasil.com/finance?format=json-cors&key=5c81598a";
    Response resposta = await get(Uri.parse(urlHgFinancas));
    Map cotacao = json.decode(resposta.body);
    setState(() {
      _blockchainInfo = cotacao["results"]["bitcoin"]["blockchain_info"]["last"];
      _bitStamp = cotacao["results"]["bitcoin"]["bitstamp"]["last"];
      _mercadoBitcoin = cotacao["results"]["bitcoin"]["mercadobitcoin"]["last"];
      _coinBase = cotacao["results"]["bitcoin"]["coinbase"]["last"];
      _foxBIt = cotacao["results"]["bitcoin"]["foxbit"]["last"];
      
      _variacaoBlockchainInfo = cotacao["results"]["bitcoin"]["blockchain_info"]["variation"];
      _variacaoBitStamp = cotacao["results"]["bitcoin"]["bitstamp"]["variation"];
      _variacaoMercadoBitcoin = cotacao["results"]["bitcoin"]["mercadobitcoin"]["variation"];
      _variacaoCoinBase = cotacao["results"]["bitcoin"]["coinbase"]["variation"];
      _variacaoFoxBIt = cotacao["results"]["bitcoin"]["foxbit"]["variation"];
    });
  }

  _irMoedas() {
    Navigator.pushNamed(context, "/pgMoedas");
  }

  _criaBody() {
    _buscarBitcoin();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Bitcoin"),
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
                          const Text("Blockchain.info"),
                          Row(
                            children: [
                              Text(_blockchainInfo.toString()),
                              TextoVariacao(variacao: _variacaoBlockchainInfo)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("BitStamp"),
                          Row(
                            children: [
                              Text(_bitStamp.toString()),
                              TextoVariacao(variacao: _variacaoBitStamp)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Mercado Bitcoin"),
                          Row(
                            children: [
                              Text(_mercadoBitcoin.toString()),
                              TextoVariacao(variacao: _variacaoMercadoBitcoin)
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
                          const Text("Coinbase"),
                          Row(
                            children: [
                              Text(_coinBase.toString()),
                              TextoVariacao(variacao: _variacaoCoinBase)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("FoxBit"),
                          Row(
                            children: [
                              Text(_foxBIt.toString()),
                              TextoVariacao(variacao: _variacaoFoxBIt)
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
            texto: "Página Principal",
            funcao: _irMoedas,
          )
        ],
      ),
    );
  }
}
