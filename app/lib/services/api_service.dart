import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = Platform.isAndroid ? '192.168.0.16' : 'localhost';

  static Future<ImageProvider> sendCsv(List<dynamic> data, int k) async {
    String str = const ListToCsvConverter().convert(
      data as List<List<dynamic>>,
    );

    final response = await http.post(
      Uri.parse('http://$url:8080/csv'),
      body: str,
      headers: {
        'k-value': k.toString(),
      },
    );

    return Image.memory(response.bodyBytes).image;
  }

  static Future<ImageProvider> sendRawData(String data, int k) async {
    final response = await http.post(
      Uri.parse('http://$url:8080/csv'),
      body: data,
      headers: {
        'k-value': k.toString(),
      },
    );

    return Image.memory(response.bodyBytes).image;
  }
}
