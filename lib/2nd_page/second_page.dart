import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

class second_page extends StatefulWidget {
  @override
  State<second_page> createState() => _second_pageState();
}

class _second_pageState extends State<second_page> {
  WebViewController controller;

  final String iOSTestUnitId = 'ca-app-pub-3940256099942544/2934735716';
  final String androidTestUnitId = 'ca-app-pub-3940256099942544/6300978111';

  BannerAd banner;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // banner = BannerAd(
    //   listener: AdListener(),
    //   size: AdSize.smartBanner,
    //   adUnitId: Platform.isIOS ? iOSTestUnitId : androidTestUnitId,
    //   request: AdRequest(),
    // )
    //   ..load();

    // WebView(initialUrl:
    // 'https://www.weather.go.kr/wgis-nuri/html/map.html',
    //   javascriptMode: JavascriptMode.unrestricted,);

  }

  @override
  Widget build(BuildContext context) {
    double itemSize;
    Size size = MediaQuery
        .of(context)
        .size; // 앱이 구동되는 모바일폰의 화면 사이즈를 가지고 오는 것
    itemSize = size.width / 3; // 초기값 3

    // TODO: implement build
    return Scaffold(
      body: WebView(
              //  initialUrl: 'https://www.weather.go.kr/w/image/radar.do',
              initialUrl:
              'https://www.weather.go.kr/wgis-nuri/html/map.html',

              // initialUrl: 'http://www.kweather.co.kr/data/RDR/RDR_CMI_202110092300.png',

              javascriptMode: JavascriptMode.unrestricted,

              onWebViewCreated: (controller) {
                this.controller = controller;
                //
                //   controller.evaluateJavascript(
                //       "document.getElementsByTagName('head')[0].style.display='none';");
                //   controller.evaluateJavascript(
                //       "document.getElementsByClassName('head')[0].style.display='none';");
                //   controller.evaluateJavascript(
                //       "document.getElementsByTagName('footer')[0].style.display='none'");
                //
                //   controller.evaluateJavascript(
                //       "document.getElementsByClassName('cont-head')[0].style.display = 'none'");
                //
                //   controller.evaluateJavascript(
                //       "document.getElementsByClassName('movie-lap01')[0].style.display = 'none'");
                //
                //   controller.evaluateJavascript(
                //       "document.getElementsByClassName('movi-set-wrap')[0].style.display = 'none'");
                //
                //   controller.evaluateJavascript(
                //       "document.getElementsByClassName('control-movi-wrap')[0].style.display = 'none'");
                //
                //   controller.evaluateJavascript(
                //       "document.getElementsByClassName('footer')[0].style.display = 'none'");
              },
            ),
    );
  }
}
