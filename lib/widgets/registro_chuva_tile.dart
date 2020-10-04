import 'package:codecipe/model/local.dart';
import 'package:codecipe/model/registro_chuva.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class RegistroChuvaTile extends StatelessWidget{
    final RegistroChuva registro;

    const RegistroChuvaTile(this.registro);

    @override
  Widget build(BuildContext context){
      final avatar = registro.volume==0
          ?CircleAvatar(child: Icon(WeatherIcons.wiDaySunny))
          :registro.volume<2
            ?CircleAvatar(child: Icon(WeatherIcons.wiDayCloudy))
            :CircleAvatar(child: Icon(WeatherIcons.wiDayRain));
      return ListTile(
        leading: avatar,
      );
    }

}