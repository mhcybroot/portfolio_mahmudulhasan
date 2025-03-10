import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/cv_model.dart';

class CVLoader {
  static Future<CV> loadCV() async {
    final String jsonData = await rootBundle.loadString('assets/cv.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonData);
    return CV.fromJson(jsonMap);
  }
} 