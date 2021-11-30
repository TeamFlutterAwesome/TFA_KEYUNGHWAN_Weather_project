import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class third_page extends StatelessWidget {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: WebView(
        // initialUrl: 'https://www.weather.go.kr/w/dust/image/sat.do',
        initialUrl:
            'https://earth.nullschool.net/#current/chem/surface/level/overlay=cosc/orthographic=-231.95,38.77,1890/loc=127.058,37.277',
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
