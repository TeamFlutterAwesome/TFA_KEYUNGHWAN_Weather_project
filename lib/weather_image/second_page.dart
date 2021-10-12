import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class second_page extends StatefulWidget {
  @override
  State<second_page> createState() => _second_pageState();
}

class _second_pageState extends State<second_page> {
  WebViewController controller;

  // InAppWebViewController webView;

  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       body: Container(
  //           child: Column(children: <Widget>[
  //             Expanded(
  //                 child: InAppWebView(
  //                   initialUrl: "https://www.weather.go.kr/w/image/vshrt/rain.do",
  //                   initialHeaders: {},
  //                   initialOptions: InAppWebViewGroupOptions(
  //                     crossPlatform: InAppWebViewOptions(
  //                         debuggingEnabled: true,
  //                         preferredContentMode: UserPreferredContentMode.DESKTOP),
  //                   ),
  //                   onWebViewCreated: (InAppWebViewController controller) {
  //                     webView = controller;
  //                   },
  //                   onLoadStart: (InAppWebViewController controller, String url) {
  //
  //                   },
  //                   onLoadStop: (InAppWebViewController controller, String url) async {
  //
  //                   },
  //                 ))
  //           ])),
  //     ),
  //   );
  // }
  //
  //

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
          WebView(
         //  initialUrl: 'https://www.weather.go.kr/w/image/radar.do',
           initialUrl: 'https://www.weather.go.kr/wgis-nuri/html/map.html',


           // initialUrl: 'http://www.kweather.co.kr/data/RDR/RDR_CMI_202110092300.png',

            javascriptMode: JavascriptMode.unrestricted,

            onWebViewCreated: (controller) {
              this.controller = controller;

              controller.evaluateJavascript("document.getElementsByTagName('head')[0].style.display='none';");
              controller.evaluateJavascript("document.getElementsByClassName('head')[0].style.display='none';");
              controller.evaluateJavascript("document.getElementsByTagName('footer')[0].style.display='none'");

              controller.evaluateJavascript("document.getElementsByClassName('cont-head')[0].style.display = 'none'");

              controller.evaluateJavascript("document.getElementsByClassName('movie-lap01')[0].style.display = 'none'");

              controller.evaluateJavascript("document.getElementsByClassName('movi-set-wrap')[0].style.display = 'none'");

              controller.evaluateJavascript("document.getElementsByClassName('control-movi-wrap')[0].style.display = 'none'");

              controller.evaluateJavascript("document.getElementsByClassName('footer')[0].style.display = 'none'");

            },
            // onPageStarted: (initialUrl) {
            //   print('New website: $initialUrl');
            //
            //   if (initialUrl.contains('http://www.weather.go.kr')) {
            //     Future.delayed(Duration(microseconds: 300),(){
            //       controller.evaluateJavascript("document.getElementsByTagName('head')[0].style.display='none';");
            //       controller.evaluateJavascript("document.getElementsByClassName('head')[0].style.display='none';");
            //       controller.evaluateJavascript("document.getElementsByTagName('footer')[0].style.display='none'");
            //     });
            //   }
            //
            // },
          ),


      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.import_export, size: 32),
      //   onPressed: () async {
      //     final url = await controller.currentUrl();
      //     print('Previous Website: $url');
      //     controller.loadUrl('https://www.weather.go.kr/w/image/vshrt/rain.do');
      //     controller.evaluateJavascript("document.getElementsByTagName('head')[0].style.display='none'");
      //     controller.evaluateJavascript("document.getElementsByTagName('footer')[0].style.display='none'");
      //   },
      // ),

    );
  }
}
