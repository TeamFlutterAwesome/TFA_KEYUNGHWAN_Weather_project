import 'package:flutter/material.dart';
import 'package:weather_project_tabview/weather_information/data/network.dart';
import 'package:weather_project_tabview/weather_information/data/my_position.dart';
import 'package:weather_project_tabview/weather_information/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '40583261296482c881a469ddb317bef5';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3;
  double longitude3;

  @override
  void initState() {
    // TODO: implement  initState
    super.initState();
    getLocation();
    // fetchData();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/'
        'weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric','https://api.openweathermap.org/data/2.5/'
        'air_pollution?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(parseWeatherData: weatherData,parseAirPollution: airData,);
    }));
  }

  // void fetchData() async {
  //
  //

  //   } else {
  //     print(response.statusCode);
  //   }
  //   //  print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),


        // body: Center(
        //   child: RaisedButton(
        //     onPressed: null,
        //     child: Text(
        //       'Get my location',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     color: Colors.blue,
        //   ),
        // ),
        );
  }
}
