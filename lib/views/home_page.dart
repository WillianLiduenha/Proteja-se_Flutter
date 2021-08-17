import 'dart:math';

import 'package:flutter/material.dart';
import 'package:protejase/repositories/temperature_repository.dart';

class Home_Page extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

String temp="";

bool show_image = true;

class _Inicio extends State<Home_Page> {
  TemperatureRepository repository = TemperatureRepository();

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
                      ? temp = await repository.solicitarTemperatura()
                      : Container();
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

                        Text(
                          "Acesso Liberado",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.green,
                          ),
                        ),
                        // Text(
                        //   "Acesso Negado",
                        //   style: TextStyle(
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ],
                    )),
        ],
      ),
    );
  }
}
