import 'dart:convert';
import 'package:flutter/services.dart';
import '../Domain/Entities/wines_entity.dart';
import '../Domain/Entities/carousel_entity.dart';

class LocalDataSource {
  Future<List<WinesEntity>> fetchWinesBy() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/v3.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final List<dynamic> winesByList = jsonMap['wines_by'];
    return winesByList.map((json) => WinesEntity.fromJson(json)).toList();
  }

  Future<List<CarouselEntity>> fetchCarousel() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/v3.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final List<dynamic> carouselList = jsonMap['carousel'];
    return carouselList.map((json) => CarouselEntity.fromJson(json)).toList();
  }
}
