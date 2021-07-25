import 'dart:math';

import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //início da tela
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Bem vindo e Proteja-se",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),

      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  

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
                  Text(
                    "Sua temperatura: " + "89" + "ºC",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(200),
                      ),
                      color: Colors.orange,
                    ),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        "Solicitar temperatura",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
