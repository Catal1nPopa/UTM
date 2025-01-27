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

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: data.map((item) {
          return InkWell(
            onTap: () => onItemSelected(item['denumire']),
            child: Container(
            width: 150,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      child: Container(
                        height: 145,
                        child: Image.network(
                          item['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(17),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          color: const Color.fromARGB(255, 158, 0, 0),
                          child: Text(
                            '${item['cantitate_produs']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      item['denumire'],
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            )
          );
        }).toList(),
      ),
    );
  }
}
