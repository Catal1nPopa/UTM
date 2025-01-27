import 'package:flutter/material.dart';

class Cardfilter extends StatelessWidget {
  final String selectedCategory;
  final Map<String, List<Map<String, dynamic>>> dataMap;
  final Function(String) onItemSelected;

  const Cardfilter({
    Key? key,
    required this.selectedCategory,
    required this.dataMap,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = dataMap[selectedCategory] ?? [];

    if (data.isEmpty) {
      return const Center(
        child: Text("No data available for this category"),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.map((item) {
          return InkWell(
            onTap: () => onItemSelected(item[selectedCategory] ?? ''),
            child: Container(
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Container(
                      height: 165,
                      child: Image.network(
                        item['image'] ?? 'https://via.placeholder.com/150',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'Quantity: ${item['cantitate']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      selectedCategory == 'type'
                          ? '${item['type']}'
                          : '${item['country']}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 51, 55, 181),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
