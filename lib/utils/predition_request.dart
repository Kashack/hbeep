import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> fetchData(
    {required int gender,
    required double age,
    required int heartDisease,
    required int married_satus,
    required int work_status,
    required int residence,
    required double glucose_level,
    required int smoke,
    required int stroke,
    required double bmi}) async {
  var client = http.Client();
  return await client.post(Uri.parse('https://hypertension.onrender.com'),
      body: jsonEncode([
        gender,age,heartDisease,married_satus,work_status,residence,glucose_level,bmi,smoke,stroke
      ]));
}
