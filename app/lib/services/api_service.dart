import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> sendCsv(List<dynamic> data) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.16:8080/csv'),
      body: data.toString(),
    );

    print(response.body);
  }
}
