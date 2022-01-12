// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_project_tabview/weather_information/first_page.dart';

import 'package:weather_project_tabview/components/theme.dart';
import 'package:weather_project_tabview/components/constants.dart';

import '2nd_page/second_page.dart';
import '3rd_page/third_page.dart';
import '4th_page/fourth_page.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:weather_project_tabview/wind_information/fifth_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  // final String iOSTestUnitId = 'ca-app-pub-3940256099942544/2934735716';
  // final String androidTestUnitId = 'ca-app-pub-3940256099942544/6300978111';
  //
  // BannerAd banner;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   banner = BannerAd(
  //     listener: AdListener(),
  //     size: AdSize.banner,
  //     adUnitId: Platform.isIOS ? iOSTestUnitId : androidTestUnitId,
  //     request: AdRequest(),
  //   )..load();
  // }

  @override
  Widget build(BuildContext context) {
    double itemSize;
    Size size = MediaQuery.of(context).size; // 앱이 구동되는 모바일폰의 화면 사이즈를 가지고 오는 것
    itemSize = size.width / 3; // 초기값 3

    // 1
    List<String> categories = ["날씨정보", "날씨영상", "미세먼지", "로또"];

    // 2
    return DefaultTabController(
      // 3
      initialIndex: 0,
      // 4
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Everyday Weather",
            style: GoogleFonts.lato(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          bottom: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.3, color: Colors.grey)),
                  color: Colors.white),
              child: TabBar(
                tabs: List.generate(
                  categories.length,
                  (index) => Tab(
                    text: categories[index],
                  ),
                ),
                // 5
                labelColor: Colors.redAccent,
                // 6
                unselectedLabelColor: Colors.grey,
                labelStyle: textTheme().headline2?.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
                // 7
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5, color: kPrimaryColor),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(42),
          ),
        ),
        // 8
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: TabBarView(
                children: [
                  first_page(),
                  second_page(),
                  third_page(),
                  fourth_page(),
                  //  fifth_page()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }






}

// 테스트
