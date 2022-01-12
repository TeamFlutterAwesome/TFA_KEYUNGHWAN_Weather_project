import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  final String url2;

  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    http.Response response1 = await http.get(Uri.parse(url));

    if (response1.statusCode == 200) {
      String jsonData = response1.body;
      var parsingData1 = jsonDecode(jsonData);
      return parsingData1;
    }
  }

  Future<dynamic> getAirData() async {
    http.Response response2 = await http.get(Uri.parse(url2));

    if (response2.statusCode == 200) {
      String jsonData = response2.body;
      var parsingData2 = jsonDecode(jsonData);
      return parsingData2;
    }
  }
}
