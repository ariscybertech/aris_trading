import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart' show rootBundle;
import 'package:trading_application/model/datum.dart';



Future<List<Datum>> loadStockData() async {
  final String fileContent = await rootBundle.loadString('assets/data/marketwatch.json');
  final List<dynamic> data = jsonDecode(fileContent);
  return data.map((json) => Datum.fromJson(json)).toList();
}
