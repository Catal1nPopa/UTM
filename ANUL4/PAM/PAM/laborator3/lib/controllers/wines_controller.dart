import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/wines.dart'; // Assuming Wine model is placed in models folder
import '../controllers/wines_by.dart';

class WineController extends GetxController {
  RxList<Wine> wines = <Wine>[].obs;
RxList<WineBy> wines_by = <WineBy>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadWines();
  }

  Future<void> loadWines() async {
    try {
      // Loading JSON from assets
      final String response = await rootBundle.loadString('assets/data/v3.json');
      final Map<String, dynamic> data = json.decode(response);
      final List winesData = data['carousel'];

      final List wines_by_data = data['wines_by'];

      // Map the JSON data to the Wine model
      wines.assignAll(
        winesData.map((wineJson) => Wine.fromJson(wineJson)).toList(),
      );

      wines_by.assignAll(
        wines_by_data.map((wineJson) => WineBy.fromJson(wineJson)).toList(),
      );
    } catch (e) {
      print("Error loading wines data: $e");
    }
  }
}
