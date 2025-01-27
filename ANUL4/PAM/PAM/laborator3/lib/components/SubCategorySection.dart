import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/wines_controller.dart';
import '../controllers/wines.dart';

class SubCategorySection extends StatefulWidget {
  final String selectedSubCategory;
  final String selectedCategory;

  const SubCategorySection(
      {Key? key,
      required this.selectedSubCategory,
      required this.selectedCategory})
      : super(key: key);

  @override
  _SubCategorySectionState createState() => _SubCategorySectionState();
}

class _SubCategorySectionState extends State<SubCategorySection> {
  late String selectedSubCategory;
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedSubCategory = widget.selectedSubCategory;
    selectedCategory = widget.selectedCategory;
  }

  @override
  void didUpdateWidget(covariant SubCategorySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedSubCategory != widget.selectedSubCategory) {
      setState(() {
        selectedSubCategory = widget.selectedSubCategory;
      });
    }
    if (oldWidget.selectedCategory != widget.selectedCategory) {
      setState(() {
        selectedCategory = widget.selectedCategory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final WineController wineController = Get.find<WineController>();

    return Obx(() {
      if (wineController.wines.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }

      List<Wine> filteredWines = selectedCategory.isEmpty
          ? wineController.wines
          : wineController.wines.where((wine) {
              if (selectedCategory.toLowerCase() == 'type') {
                print("Filtering by type: $selectedSubCategory");
                return wine.type.toLowerCase() ==
                    selectedSubCategory.toLowerCase();
              } else if (selectedCategory.toLowerCase() == 'countries') {
                print("Filtering by country: $selectedSubCategory");
                return wine.country.toLowerCase() ==
                    selectedSubCategory.toLowerCase();
              } else {
                print("No matching category");
              }
              return false;
            }).toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Wine',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedSubCategory = '';
                    selectedCategory = '';
                  });
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 223, 57, 57),
                  ),
                ),
              ),
            ],
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredWines.length,
            itemBuilder: (context, index) {
              final wine = filteredWines[index];

              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            wine.image,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 195, 228, 160),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Available',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                wine.name,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.wine_bar, size: 16),
                                  const SizedBox(width: 5),
                                  Text(
                                    wine.type,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.flag, size: 16),
                                  const SizedBox(width: 5),
                                  Text(
                                    wine.country,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border_outlined,
                              size: 16),
                          label: const Text('Favourite'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '₹ ${wine.priceUsd}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Bottle (${wine.bottleSize} ml)',
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Critics Scores: ${wine.criticScore}/100',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
