import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:protejase/repositories/temperature_repository.dart';

class Home_Page extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

String temp = "";

bool show_image = true;
bool button_hab = true;

class _Inicio extends State<Home_Page> {
  TemperatureRepository repository = TemperatureRepository();

  Future mensagem(BuildContext context, String texto) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Container(
            height: 35,
            child: Text(
              "Seu acesso foi negado!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(texto),
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
                                child: TextButton(
                                  onPressed: () {
                                    mensagem(context,
                                        "Lotação máxima atingida, volte outra hora.");
                                  },
                                  child: Text(
                                    "Lotação Máxima atingida",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.red,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                    ),
                                    temp != 'LOTACAO MAXIMA'
                                        ? double.parse(temp) < 37.7 &&
                                                double.parse(temp) >= 33
                                            ? Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "Acesso Liberado",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 40,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Por favor, direcione-se para a porta dentro de 1(um) minuto. Após o prazo, será necessário realizar este processo novamente.",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Expanded(
                                                child: TextButton(
                                                  onPressed: () {
                                                    mensagem(context,
                                                        "A temperatura medida foi superior a 37.7 ºC ou menor que a temperatura mínima definida (33ºC). \n\nProcure um posto de saúde para identificar possíveis sintomas da COVID-19.\n\nProcure a sala de testes de COVID-19.");
                                                  },
                                                  child: Text(
                                                    "Acesso Negado",
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 40,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              )
                                        : Container(),
                                  ],
                                ),
                              ),
                      ],
                    ),),
                     Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color:
                    button_hab ? Color.fromRGBO(111, 233, 225, 1) : Colors.grey,
              ),
              child: TextButton.icon(
                onPressed: button_hab
                    ? () async {
                        button_hab = false;
                        show_image
                            ? temp = '38.5'
                            // temp = await repository.solicitarTemperatura()
                            : Container();

                        temp == 'LOTACAO MAXIMA'
                            ? show_image
                                ? await mensagem(context,
                                    "Lotação máxima atingida, volte outra hora.")
                                : Container()
                            : double.parse(temp) > 37.7 && show_image ||
                                    double.parse(temp) < 33 && show_image
                                ? await mensagem(context,
                                    "A temperatura medida foi superior a 37.7ºC ou menor que a temperatura mínima definida (33ºC). \n\nProcure um posto de saúde para identificar possíveis sintomas da COVID-19.\n\nProcure a sala de testes de COVID-19.")
                                : Container();

                        setState(
                          () {
                            show_image = !show_image;
                            Timer(Duration(seconds: 5), () {button_hab = true; setState(() {
                              
                            });});
                            
                          },
                        );
                      }
                    : () {},
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
        ],
      ),
    );
  }
}
