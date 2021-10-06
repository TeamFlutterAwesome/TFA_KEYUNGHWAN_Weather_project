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
            body: WebView(
                  initialUrl: 'https://www.weather.go.kr/w/image/vshrt/rain.do',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller)
                      {
                     this.controller = controller;
                      },
    //    actionButton: FloatingActionButton(
    // child: Icon(Icons.import_export,size: 32),
    // onPressed: () async {},
    // ),

    )
    ,
    );



  }


}
