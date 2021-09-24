import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_project_tabview/weather_information/screens/loading.dart';


class first_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      color: Colors.greenAccent,
      home: Loading(),
    );
  }

}