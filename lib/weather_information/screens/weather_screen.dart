import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather_project_tabview/weather_information/model/model.dart';
import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirPollution});

  final dynamic parseWeatherData;
  final dynamic parseAirPollution;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String iOSTestUnitId = 'ca-app-pub-3940256099942544/2934735716';
  final String smartbannerId =
      'ca-app-pub-5478589299711073/7321662680'; // 배너 ID 적용
  final String nativeId =
      'ca-app-pub-5478589299711073/8114318845'; // native ad ID

  BannerAd banner;
  NativeAd native;

  Model model = Model();
  String cityName;
  int temp;
  Widget icon;
  String des;
  Widget airIcon;
  String airState;
  double dust1;
  double dust2;

  var date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updateData(widget.parseWeatherData, widget.parseAirPollution);

    banner = BannerAd(
      listener: AdListener(),
      size: AdSize.smartBanner, //smartBanner
      adUnitId: Platform.isIOS ? iOSTestUnitId : smartbannerId,
      request: AdRequest(),
    )..load();

    native = NativeAd(
      listener: AdListener(),
      //   size: AdSize.smartBanner, //smartBanner
      adUnitId: Platform.isIOS ? iOSTestUnitId : nativeId,
      request: AdRequest(),
    )..load();
  }

  void updateData(dynamic weatherData, dynamic airData) {
    double temp2 = weatherData['main']['temp'].toDouble();
    int condition = weatherData['weather'][0]['id'];
    int index = airData['list'][0]['main']['aqi'];
    des = weatherData['weather'][0]['description'];
    dust1 = airData['list'][0]['components']['pm10'].toDouble();
    dust2 = airData['list'][0]['components']['pm2_5'].toDouble();
    temp = temp2.round();
    cityName = weatherData['name'];
    icon = model.getWeatherIcon(condition);
    airIcon = model.getAirIcon(index);
    airState = model.getAirCondition(index).toString().substring(6, 12);

    // print(temp);
    // print(cityName);
    // print(airState);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // 앱이 구동되는 모바일폰의 화면 사이즈를 가지고 오는 것
    //double itemSize = size.width / 3; // 초기값 3

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
          extendBodyBehindAppBar: true, // appbar 색을 바디색과 동일하게 하기 위한 것
          appBar: new AppBar(
            //title: Text(''),
            backgroundColor: Colors.transparent, // appbar 색을 바디색과 동일하게 하기 위한 것
            elevation: 0.0, // appbar 색을 바디색과 동일하게 하기 위한 것
            leading: IconButton(
                icon: Icon(Icons.near_me), onPressed: () {}, iconSize: 30.0),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.location_searching,
                  ),
                  onPressed: () {},
                  iconSize: 30.0)
            ],
          ),
          body: new Container(
            child: Stack(
              children: [
                Image.asset(
                  'lib/weather_information/image/background.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height / 12, //120.0,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width / 20, //
                                    ),
                                    Text(
                                      '$cityName',
                                      style: GoogleFonts.lato(
                                          fontSize: size.height / 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height / 40, //120.0,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width / 20, //
                                    ),
                                    TimerBuilder.periodic(
                                      (Duration(minutes: 1)),
                                      builder: (context) {
                                        print('${getSystemTime()}');
                                        return Text(
                                          '${getSystemTime()}',
                                          style: GoogleFonts.lato(
                                              fontSize: size.height / 40,
                                              color: Colors.white),
                                        );
                                      },
                                    ),
                                    Text(DateFormat(' - EEEE, ').format(date),
                                        style: GoogleFonts.lato(
                                            fontSize: size.height / 40,
                                            color: Colors.white)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width / 20, //
                                    ),
                                    Text(DateFormat('d MMM, yyy').format(date),
                                        style: GoogleFonts.lato(
                                            fontSize: size.height / 40,
                                            color: Colors.white)),
                                  ],
                                )
                              ], //children
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width / 20, //
                                    ),
                                    Text(
                                      '$temp\u2103',
                                      style: GoogleFonts.lato(
                                          fontSize: size.height / 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    icon,
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width / 20, //
                                    ),
                                    Text(
                                      '$des',
                                      style: GoogleFonts.lato(
                                        fontSize: size.height / 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ], // children
                            ),
                          ], //children
                        ),
                      ),
                      Column(
                        children: [
                          Divider(
                            height: 15.0,
                            thickness: 2.0,
                            color: Colors.white30,
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  // 첫번째 컬럼
                                  children: [
                                    Text(
                                      'AQI(대기질지수)',
                                      style: GoogleFonts.lato(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    airIcon,
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$airState',
                                      style: GoogleFonts.lato(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  // 두번째 컬럼
                                  children: [
                                    Text(
                                      '미세먼지',
                                      style: GoogleFonts.lato(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$dust1',
                                      style: GoogleFonts.lato(
                                        fontSize: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'μg/m3',
                                      style: GoogleFonts.lato(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  // 세번째 컬럼
                                  children: [
                                    Text(
                                      '초미세먼지',
                                      style: GoogleFonts.lato(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '$dust2',
                                      style: GoogleFonts.lato(
                                        fontSize: 24.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'μg/m3',
                                      style: GoogleFonts.lato(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 90.0,
                            child: this.banner == null
                                ? Container()
                                : AdWidget(ad: this.banner),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }


}

Future<bool> _onBackPressed() {
  return showDialog(
    // context: context,
    builder: (context) => new AlertDialog(
      title: new Text('Are you sure?'),
      content: new Text('Do you want to exit an App'),
      actions: <Widget>[
        new GestureDetector(
          onTap: () => Navigator.of(context).pop(false),
          child: Text("NO"),
        ),
        SizedBox(height: 16),
        new GestureDetector(
          onTap: () => Navigator.of(context).pop(true),
          child: Text("YES"),
        ),
      ],
    ),
  ) ??
      false;
}
