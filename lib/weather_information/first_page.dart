import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_project_tabview/weather_information/screens/loading.dart';


class first_page extends StatefulWidget {
  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Everyday Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      color: Colors.greenAccent,
      home: Loading(),
    );
  }
}