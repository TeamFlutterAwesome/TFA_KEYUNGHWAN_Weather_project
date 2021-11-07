import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class fourth_page extends StatelessWidget {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: WebView(
        //  initialUrl: 'https://www.weather.go.kr/w/ocean/chart/wave-model.do',
        initialUrl: 'https://www.dhlottery.co.kr/common.do?method=main',
        javascriptMode: JavascriptMode.unrestricted,

        onWebViewCreated: (controller) {
          this.controller = controller;

          controller.evaluateJavascript(
              "document.getElementsById('head')[0].style.display='none';");
          controller.evaluateJavascript(
              "document.getElementsByClassName('site-head')[0].style.display='none'");
          controller.evaluateJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");

          controller.evaluateJavascript(
              "document.getElementsByClassName('cont-head')[0].style.display = 'none'");

          controller.evaluateJavascript(
              "document.getElementsByClassName('movie-lap01')[0].style.display = 'none'");

          controller.evaluateJavascript(
              "document.getElementsByClassName('movi-set-wrap')[0].style.display = 'none'");

          controller.evaluateJavascript(
              "document.getElementsByClassName('control-movi-wrap')[0].style.display = 'none'");

          controller.evaluateJavascript(
              "document.getElementsByClassName('footer')[0].style.display = 'none'");

          controller.evaluateJavascript(
              "document.getElementsByClassName('sticky-wrapper')[0].style.display='none';");
        },
      ),
    );
  }
}
