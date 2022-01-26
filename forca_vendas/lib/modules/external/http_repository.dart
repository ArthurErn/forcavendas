import 'dart:convert';
import 'package:http/http.dart' as http;

import 'repository_interface.dart';

class HttpRepository implements IRepository {
  @override
  Future connect(String url) async {
    try {
      Uri uri = Uri.parse(url);
      String basicAuth = 'Basic ' + base64Encode(utf8.encode('admin:admin'));
      http.Response response = await http
          .get(uri, headers: <String, String>{'authorization': basicAuth});
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
