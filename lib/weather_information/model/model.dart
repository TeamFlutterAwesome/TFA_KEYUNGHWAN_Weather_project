import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'lib/weather_information/svg/Cloud-Lightning.svg',
        color: Colors.black87,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'lib/weather_information/svg/Cloud-Snow-Alt.svg',
        color: Colors.black87,);
    } else if (condition == 800) {
      return SvgPicture.asset(
        'lib/weather_information/svg/Sun.svg',
        color: Colors.black87,);
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'lib/weather_information/svg/Cloud-Sun.svg',
        color: Colors.black87,);
    }
  }

  Widget getAirIcon(int index) {
    if (index == 1) {
      return Image.asset('lib/weather_information/image/good.png',
        width: 37.0,
        height: 35.0,);
    } else if (index == 2) {
      return Image.asset('lib/weather_information/image/fair.png',
        width: 37.0,
        height: 35.0,);
    } else if (index == 3) {
      return Image.asset('lib/weather_information/image/moderate.png',
        width: 37.0,
        height: 35.0,);
    } else if (index == 4) {
      return Image.asset('lib/weather_information/image/poor.png',
        width: 37.0,
        height: 35.0,);
    } else if (index == 5) {
      return Image.asset('lib/weather_information/image/bad.png',
        width: 37.0,
        height: 35.0,);
    }
  }

  Widget getAirCondition(int index) {
    if (index == 1) {
      return Text('"매우좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),);
    } else if (index == 2) {
      return Text('"좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),);
    } else if (index == 3) {
      return Text('"보통"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),);
    } else if (index == 4) {
      return Text('"나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),);
    } else if (index == 5) {
      return Text('"매우나쁨"',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),);
    }
  }
}
