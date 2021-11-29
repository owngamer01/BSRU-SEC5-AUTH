import 'dart:convert';
import 'dart:io';

import 'package:myapp/model/food_model.dart';
import 'package:http/http.dart' as http;

class OrderService {

  final baseUrl = 'http://10.0.2.2:3000';

  Future<bool> orderConfirm(List<FoodItem> foods) async {
    try {
      var url = Uri.parse('$baseUrl/confirm_order');
      var response = await http.post(url, body: 
        json.encode(
          foods.map((item) => item.toJson()
        ).toList())
      , 
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      });

      if (response.statusCode == HttpStatus.ok) {
        return json.decode(response.body)['status'];
      }

      throw Exception('Unable to read');
    } 
    catch (e) {
      print('[orderConfirm]: ${e.toString()}');
      rethrow;
    }
  }
}