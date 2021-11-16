import 'dart:convert';
import 'package:http/http.dart' as http;

class TemperatureRepository {
  Future<dynamic> solicitarTemperatura() async {
    // 'Batendo' diretamente no servidor do GitPod.io
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/solicitartemperatura");*/

    // 'Batendo' diretamente no servidor do heroku
    //String url = 'https://proteja-se-api.herokuapp.com/solicitartemperatura';

    // 'Batendo' no site hospedado (que redireciona para o heroku)
    String url = 'http://protejase.hopto.org/solicitartemperatura';
    // String url = 'http://192.168.0.114/solicitartemperatura';

    var response = await http.get(Uri.parse(url));
    print(response.statusCode);

    return response.body;
  }
}
