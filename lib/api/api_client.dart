import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'konstanta.dart';

class ApiClient {
  static final client = http.Client();

  static Future<Map<String, dynamic>> get(String url) async {
    final response = await client.get(
      Uri.parse('${Konstanta.baseUrl}$url'),
      headers: {
        "content-type": "application/x-www-form-urlencoded",
      },
    );
    log('======== ENDPOINT GET =========');
    log(url);
    log('======== RESULT =========');
    log(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> hasil = json.decode(response.body);
      return hasil;
    } else {
      return {};
    }
  }

  static Future<Map<String, dynamic>> post(String url, Map data) async {
    final response = await client.post(
      Uri.parse('${Konstanta.baseUrl}$url'),
      headers: {
        "content-type": "application/x-www-form-urlencoded",
      },
      body: data,
    );
    log('======== ENDPOINT POST =========');
    log(url);
    log('======== RESULT =========');
    log(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> hasil = json.decode(response.body);
      return hasil;
    } else {
      return {};
    }
  }

  static Future<Map<String, dynamic>> delete(String url) async {
    final response = await client.delete(
      Uri.parse('${Konstanta.baseUrl}$url'),
      headers: {
        "content-type": "application/x-www-form-urlencoded",
      },
    );
    log('======== ENDPOINT DELETE =========');
    log(url);
    log('======== RESULT =========');
    log(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> hasil = json.decode(response.body);
      return hasil;
    } else {
      return {};
    }
  }
}
