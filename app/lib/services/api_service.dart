import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<ImageProvider> sendCsv(List<dynamic> data, int k) async {
    String str = const ListToCsvConverter().convert(
      data as List<List<dynamic>>,
    );

    final response = await http.post(
      Uri.parse('http://localhost:8080/csv'),
      body: str,
      headers: {
        'k-value': k.toString(),
      },
    );

    return Image.memory(response.bodyBytes).image;
  }
}
