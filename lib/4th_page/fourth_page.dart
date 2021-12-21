import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class fourth_page extends StatefulWidget {
  @override
  State<fourth_page> createState() => _fourth_pageState();
}

class _fourth_pageState extends State<fourth_page> {
  WebViewController controller;

  final String iOSTestUnitId = 'ca-app-pub-3940256099942544/2934735716';
  final String androidTestUnitId = 'ca-app-pub-3940256099942544/6300978111';

  BannerAd banner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    banner = BannerAd(
      listener: AdListener(),
      size: AdSize.smartBanner,
      adUnitId: Platform.isIOS ? iOSTestUnitId : androidTestUnitId,
      request: AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double itemSize;
    Size size = MediaQuery.of(context).size; // 앱이 구동되는 모바일폰의 화면 사이즈를 가지고 오는 것
    itemSize = size.width / 3; // 초기값 3

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height / 1.4,
            child: WebView(
              //  initialUrl: 'https://www.weather.go.kr/w/ocean/chart/wave-model.do',
              initialUrl: 'https://www.dhlottery.co.kr/common.do?method=main',
              javascriptMode: JavascriptMode.unrestricted,

              // onWebViewCreated: (controller) {
              //   this.controller = controller;
              //
              //   controller.evaluateJavascript(
              //       "document.getElementsById('head')[0].style.display='none';");
              //   controller.evaluateJavascript(
              //       "document.getElementsByClassName('site-head')[0].style.display='none'");
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
              //
              //   controller.evaluateJavascript(
              //       "document.getElementsByClassName('sticky-wrapper')[0].style.display='none';");
              // },
            ),
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            color: Colors.white,
            height: size.height / 10,
            child:
                this.banner == null ? Container() : AdWidget(ad: this.banner),
          ),
        ],
      ),
    );
  }
}
