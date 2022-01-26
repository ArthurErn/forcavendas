import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:http/http.dart' as http;

class HttpPost {
  Future connect(String url, json, context) async {
    var uri = Uri.parse(url);
    try {
      var data = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json,
      );
      return jsonDecode(data.body);
    } catch (e) {
      Notify().pop(context, 'Erro ao realizar operação!', Icons.close,
          Colors.red, 'Erro!');
    }
  }
}
