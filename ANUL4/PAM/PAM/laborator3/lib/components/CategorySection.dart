import 'package:flutter/material.dart'; 
import 'package:laborator2/components/CardFilter.dart';
import 'package:laborator2/controllers/wines.dart';
import '../components/CustomButton.dart';

class CategorySection extends StatelessWidget {
  final String selectedCategory;
  final List<Wine> dataMap;
  final Function(String) updateCategory;
final Function(String) onItemSelected;

  const CategorySection({
    required this.selectedCategory,
    required this.dataMap,
    required this.updateCategory,
    required this.onItemSelected,
    super.key,
  });

  Map<String, List<Map<String, dynamic>>> _buildDataMap() {
    final Map<String, List<Map<String, dynamic>>> categorizedData = {};

    if (selectedCategory == 'Type') {
      final uniqueTypes = <String, Map<String, dynamic>>{};
      for (var wine in dataMap) {
        uniqueTypes.putIfAbsent(
          wine.type,
          () => {
            'image': wine.image,
            'cantitate_produs': wine.bottleSize,
            'denumire': wine.type,
          },
        );
      }
      categorizedData['Type'] = uniqueTypes.values.toList();
    } else if (selectedCategory == 'Countries') {
      final uniqueCountries = <String, Map<String, dynamic>>{};
      for (var wine in dataMap) {
        uniqueCountries.putIfAbsent(
          wine.country,
          () => {
            'image': wine.image,
            'cantitate_produs': wine.bottleSize,
            'denumire': wine.country,
          },
        );
      }
      categorizedData['Countries'] = uniqueCountries.values.toList();
    }

    return categorizedData;
  }

  @override
  Widget build(BuildContext context) {
    final filteredDataMap = _buildDataMap();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Shop wines by",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                label: "Type",
                onPressed: () => updateCategory('Type'),
              ),
              CustomButton(
                label: "Style",
                onPressed: () => updateCategory('Style'),
              ),
              CustomButton(
                label: "Countries",
                onPressed: () => updateCategory('Countries'),
                width: 90,
              ),
              CustomButton(
                label: "Grape",
                onPressed: () => updateCategory('Grape'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: Cardfilter(
              selectedCategory: selectedCategory,
              dataMap: filteredDataMap,
              onItemSelected: onItemSelected,
            ),
          ),
        ],
      ),
    );
  }
}
