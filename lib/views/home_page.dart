import 'dart:math';

import 'package:flutter/material.dart';
import 'package:protejase/repositories/temperature_repository.dart';

class Home_Page extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

String temp = "";

bool show_image = true;

class _Inicio extends State<Home_Page> {
  TemperatureRepository repository = TemperatureRepository();

  Future mensagem(BuildContext context, String texto) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text(texto),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "OK",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //início da tela
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromRGBO(111, 233, 225, 1),
        title: Text(
          "Proteja-se",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromRGBO(111, 233, 225, 1),
              ),
              child: TextButton.icon(
                onPressed: () async {
                  show_image
                      ?
                      //  temp = '35'
                      await repository.solicitarTemperatura()
                      : Container();

                  temp == 'LOTACAO MAXIMA' && show_image
                      ? await mensagem(
                          context, "Lotação máxima atingida, volte outra hora.")
                      : temp != 'LOTACAO MAXIMA' &&
                              double.parse(temp) < 37.7 &&
                              double.parse(temp) >= 35
                          ? Container()
                          : await mensagem(context,
                              "A temperatura medida foi superior a 37.7 ºC. \nProcure um posto de saúde para identificar possíveis sintomas da COVID-19.\n Procure a sala de testes de COVID-19.");

                  setState(
                    () {
                      show_image = !show_image;
                    },
                  );
                },
                label: Text(
                  "   " + "Iniciar medição",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Colors.black,
                  ),
                ),
                icon: Container(
                    width: 100,
                    child: Image.asset("assets/images/termometro.png")),
              ),
            ),
          ),
          Container(
              color: Color.fromRGBO(232, 225, 225, 1),
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.9,
              child: show_image
                  ? Container(
                      child: Image.asset("assets/images/white_in_white.png"),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        temp == 'LOTACAO MAXIMA'
                            ? Container(
                                child: Text(
                                  "Lotação Máxima",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Sua temperatura: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                        ),
                                      ),
                                      Text(
                                        temp + " ºC",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 52,
                                        ),
                                      ),
                                    ],
                                  ),
                                  temp != 'LOTACAO MAXIMA' &&
                                          double.parse(temp) < 37.7 &&
                                          double.parse(temp) >= 35
                                      ? Container(
                                          child: Column(
                                                                                        children: [
                                              Text(
                                                "Acesso Liberado",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Text(
                                                  "Por favor, direcione-se para a porta dentro de 1(um) minuto, após o prazo, será necessário realizar este processo novamente."),
                                            ],
                                          ),
                                        )
                                      : Text(
                                          "Acesso Negado",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: Colors.red,
                                          ),
                                        ),
                                ],
                              ),
                      ],
                    )),
        ],
      ),
    );
  }
}
