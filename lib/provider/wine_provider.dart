import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:menu_demo/model/wine_model.dart';
import 'package:http/http.dart' as http;

class WineProvider with ChangeNotifier {
   List<Wine> _wines = [];
  List<Wine> get wines => _wines;
  Future<void> fetchWines() async {
    try {
      final response =
          await http.get(Uri.parse('http://sparrowkirkland.com/section_data.json'));
          print(response.body);
          if (response.statusCode == 200) {
            final List<dynamic> wineData = jsonDecode(response.body);
            _wines = wineData.map((json) => Wine.fromJson(json)).toList();
            notifyListeners();
          }else{
            throw Exception('Fail');
          }
    } catch (e) {
      throw Exception('Fail $e');
    }
  }
}
