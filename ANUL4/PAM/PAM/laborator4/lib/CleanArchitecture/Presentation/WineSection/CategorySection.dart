import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laborator2/CleanArchitecture/Domain/Entities/carousel_entity.dart';
import 'package:laborator2/CleanArchitecture/Domain/Entities/wines_entity.dart';
import 'package:laborator2/CleanArchitecture/Presentation/WineSection/CardFilter.dart';
import 'package:laborator2/CleanArchitecture/Presentation/WineSection/CustomButton.dart';

class CategorySection extends StatelessWidget {
  final String selectedCategory;
  final RxList<CarouselEntity> carouselData;
  final RxList<WinesEntity> wineData;
  final Function(String) updateCategory;
  final Function(String) onItemSelected;

  const CategorySection({
    required this.selectedCategory,
    required this.carouselData,
    required this.wineData,
    required this.updateCategory,
    required this.onItemSelected,
    super.key,
  });

  Map<String, List<Map<String, dynamic>>> _buildDataMap() {
    final Map<String, List<Map<String, dynamic>>> categorizedData = {};

    final List<CarouselEntity> carouselList = carouselData.toList();

    if (selectedCategory == 'type') {
      final Map<String, Map<String, dynamic>> uniqueTypes = {};
      for (var carousel in carouselList) {
        if (!uniqueTypes.containsKey(carousel.type)) {
          uniqueTypes[carousel.type] = {
            'image': carousel.image,
            'price_usd': carousel.priceUsd,
            'name': carousel.name,
            'type': carousel.type,
            'cantitate': carousel.cantitate
          };
        }
      }

      categorizedData['type'] = uniqueTypes.values.toList();
    }

    if (selectedCategory == 'country') {
      final Map<String, Map<String, dynamic>> uniqueCountries = {};
      for (var carousel in carouselList) {
        if (!uniqueCountries.containsKey(carousel.from.country)) {
          uniqueCountries[carousel.from.country] = {
            'image': carousel.image,
            'price_usd': carousel.priceUsd,
            'name': carousel.name,
            'country': carousel.from.country,
            'city': carousel.from.city,
            'cantitate': carousel.cantitate,
          };
        }
      }

      categorizedData['country'] = uniqueCountries.values.toList();
    }

    return categorizedData;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                  onPressed: () => updateCategory('type'),
                ),
                CustomButton(
                  label: "Style",
                  onPressed: () => updateCategory('style'),
                ),
                CustomButton(
                  label: "Countries",
                  onPressed: () => updateCategory('country'),
                  width: 90,
                ),
                CustomButton(
                  label: "Grape",
                  onPressed: () => updateCategory('grape'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Cardfilter(
                selectedCategory: selectedCategory,
                dataMap: filteredDataMap,
                onItemSelected: onItemSelected,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    });
  }
}
