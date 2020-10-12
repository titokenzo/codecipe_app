import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:flutter/material.dart';
import '../dashboard_api.dart';

class CryptoData {

  static Future<List<Map<String, Object>>> acessaApi() async{
    print("acessaApi");
    DashboardApi api = DashboardApi();
    List<Map<String, Object>> resposta = [];
    var response = await api.getList();
    print("getLista");
    var ico = WeatherIcons.wiDaySunny;
    var cor = Colors.yellow;
    var dados = response[0];
    for (Object linha in dados){
      var dado = Map<String,Object>.from(linha);
      if (double.parse(dado["previsao"]) <= 0.3){
        ico = WeatherIcons.wiDaySunny;
        cor = Colors.blue;
      } else {
        if (double.parse(dado["previsao"]) > 1.3) {
          ico = WeatherIcons.wiRain;
          cor = Colors.black87;
        } else {
          ico = WeatherIcons.wiCloud;
          cor = Colors.black12;
        }
      }
      Map<String, dynamic> item = {
        "name": dado["cidade"],
        "icon": ico,
        "iconColor": cor,
        "dia30": dado["acum30"],
        "ontem": dado["acum1"],
        "hoje": dado["previsao"],
        "amanha": dado["amanha"],
        "symbol": " "
      };
      resposta.add(item);
    }
    for (Map<String, dynamic>item in resposta){
      print(item["cidade"]);
    }
    return resposta;
  }
  static List<Map<String, Object>> getData = [

    {
      'name': 'Recife',
      'symbol': 'REC',
      'icon': WeatherIcons.wiDaySunny,
      'iconColor': Colors.orange,
      'change': '+3.67%',
      'changeValue': '+202.835',
      'changeColor': Colors.green,
      'value': '12.279',
    },
    {
      'name': 'Jaboatão',
      'symbol': 'JAB',
      'icon': WeatherIcons.wiDayCloudy,
      'iconColor': Colors.black,
      'change': '+5.2%',
      'changeValue': '25.567',
      'changeColor': Colors.green,
      'value': '7.809'
    },
    {
      'name': 'Olinda',
      'symbol': 'OLI',
      'icon': WeatherIcons.wiRain,
      'iconColor': Colors.blue,
      'change': '+6.18%',
      'changeValue': '23.879',
      'changeColor': Colors.green,
      'value': '8.91'
    },
  ];

}
