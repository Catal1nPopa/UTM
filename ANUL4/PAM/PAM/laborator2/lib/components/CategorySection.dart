import 'package:flutter/material.dart';
import '../components/CustomButton.dart';
import '../components/CardFilter.dart';

class CategorySection extends StatelessWidget {
  final String selectedCategory;
  final Map<String, List<Map<String, dynamic>>> dataMap;
  final Function(String) updateCategory;

  const CategorySection({
    required this.selectedCategory,
    required this.dataMap,
    required this.updateCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              dataMap: dataMap,
            ),
          ),
        ],
      ),
    );
  }
}
