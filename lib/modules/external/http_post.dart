import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:http/http.dart' as http;

class HttpPost {
  Future connect(String url, json, context) async {
    var uri = Uri.parse(url);
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('admin:admin'));
    try {
      var data = await http.post(
        uri,
        headers: {'authorization': basicAuth},
        body: json,
      );
      return jsonDecode(data.body);
    } catch (e) {
      Notify().pop(context, 'Erro ao realizar operação!', Icons.close,
          Colors.red, 'Erro!');
    }
  }
}
