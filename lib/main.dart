import 'package:flutter/material.dart';
import 'package:weather_project_tabview/weather_information/first_page.dart';
import 'package:weather_project_tabview/weather_image/second_page.dart';
import 'package:weather_project_tabview/dust_information/third_page.dart';
import 'package:weather_project_tabview/sea_information/fourth_page.dart';
import 'package:weather_project_tabview/components/theme.dart';
import 'package:weather_project_tabview/components/constants.dart';

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
      title: 'Weather project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double itemSize;
    Size size = MediaQuery.of(context).size; // 앱이 구동되는 모바일폰의 화면 사이즈를 가지고 오는 것
    itemSize = size.width / 3;

    // 1
    List<String> categories = ["날씨정보", "날씨영상", "미세먼지", "바다날씨"];

    // 2
    return DefaultTabController(
      // 3
      initialIndex: 0,
      // 4
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Weather app project"),
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
                  borderSide: BorderSide(width: 4, color: kPrimaryColor),
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
                  fourth_page()
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: itemSize / 2,
              // 바텀바의 크기 조정
              child: Container(
                color: Colors.black, // 배너가 들어가야 할 위치
              ),
            ),
          ],
        ),
      ),
    );
  }
}
