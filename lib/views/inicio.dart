import 'dart:math';

import 'package:flutter/material.dart';

class inicio extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //início da tela
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(
                      255, 255, 255, 0.4), //primeira cor, que vem de baixo
                  Color.fromRGBO(
                      111, 233, 225, 0.695), //segunda cor, que vem de cima
                ],
                stops: [0.2, 0.8],
                transform: GradientRotation(2.5 * pi))),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/black_in_black.png",
                ),
                Text(
                  "Seja bem-vindo(a)!",
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/acesso'),
                    child: Text(
                      "Acesso ao sistema",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    style: ButtonStyle(
                      shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(111, 233, 225, 1)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
