import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Model{
  Widget getWeatherIcon(int condition){
    if(condition < 300){
      return SvgPicture.asset('weather_project_tabview/weather_information/svg/Cloud-Lightning.svg',
      color: Colors.black87,
      );
    } else if (condition < 600){
      return SvgPicture.asset('weather_project_tabview/weather_information/svg/Cloud-Snow.svg',
        color: Colors.black87,
      );
    } else if (condition == 800){
      return SvgPicture.asset('weather_project_tabview/weather_information/svg/Sun.svg',
        color: Colors.black87,
      );
    } else if (condition <= 804){
      return SvgPicture.asset('weather_project_tabview/weather_information/svg/Cloud-Sun.svg',
        color: Colors.black87,
      );
    }
  }
}