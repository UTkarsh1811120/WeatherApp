import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelp {
  NetworkHelp(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodeddata = jsonDecode(data);
      return decodeddata;
    } else
      print(response.statusCode);
  }
}
