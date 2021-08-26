import 'dart:convert';
import 'package:http/http.dart' as http;

class TemperatureRepository {
  Future<dynamic> solicitarTemperatura() async {
    /*var url = Uri.parse(
        "https://3000-harlequin-wildcat-7ivobsaz.ws-us04.gitpod.io/cadastrarmotorista");*/
    //String url = 'https://proteja-se-api.herokuapp.com/solicitartemperatura';
    String url = 'http://protejase.hopto.org/testinho';

    var response = await http.get(Uri.parse(url));
    print(response.statusCode);

    return response.body;
  }
}
