import 'package:flutter/material.dart';

import 'home_page.dart';

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Método responsável por desenhar a tela do aplicativo.
    return MaterialApp(
            // home: inicio(),
      routes: {
        '/': (context) => Home_Page(),
      },

      initialRoute: '/',
    );
    // o home vai indicar qual é a tela inicial da aplicação
  }
}