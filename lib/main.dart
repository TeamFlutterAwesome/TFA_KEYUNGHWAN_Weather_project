import 'package:flutter/material.dart';
import 'package:weather_project_tabview/components/first_page.dart';
import 'package:weather_project_tabview/components/second_page.dart';
import 'package:weather_project_tabview/components/third_page.dart';
import 'package:weather_project_tabview/components/fourth_page.dart';


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
    // 1
    List<String> categories = ["날씨 정보", "레이더", "미세먼지", "바다 날씨"];
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
                labelColor: Colors.blue,
                // 6
                unselectedLabelColor: Colors.orange,
                // labelStyle: textTheme().headline2?.copyWith(
                //     color: kPrimaryColor, fontWeight: FontWeight.bold),
                // 7
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(42),
          ),
        ),
        // 8
        body: TabBarView(
          children: [
            first_page(),
            second_page(),
            third_page(),
            fourth_page()
          ],
        ),
      ),
    );
  }
}

