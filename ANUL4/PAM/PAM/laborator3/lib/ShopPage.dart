import 'package:flutter/material.dart';
import 'components/HeaderSection.dart';
import 'components/SearchField.dart';
import 'components/CategorySection.dart';
import 'components/SubCategorySection.dart';
import 'controllers/wines_controller.dart';
import 'package:get/get.dart';
import './controllers/wines.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String selectedCategory = '';
  String selectedSubCategory = '';
  @override
  void initState() {
    super.initState();
    Get.put(WineController());
  }

  void updateCategory(String newCategory) {
    print("Valoarea category primita in ShopPage: $newCategory");
    setState(() {
      selectedCategory = newCategory;
    });
  }

  void onItemSelected(String denumire) {
    print("Valoarea denumire primită în ShopPage: $denumire");
    setState(() {
      selectedSubCategory = denumire;
    });
  }

  @override
  Widget build(BuildContext context) {
    final WineController wineController = Get.find<WineController>();
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(),
            const SizedBox(height: 20),
            const SearchField(),
            const SizedBox(height: 20),
            CategorySection(
              selectedCategory: selectedCategory,
              dataMap: wineController.wines,
              updateCategory: updateCategory,
              onItemSelected: onItemSelected,
            ),
            SubCategorySection(
                selectedSubCategory: selectedSubCategory,
                selectedCategory: selectedCategory),
          ],
        ),
      ),
    );
  }
}
