import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laborator2/CleanArchitecture/Presentation/Controller/wine_controller.dart';
import 'package:laborator2/CleanArchitecture/Presentation/WineSection/CategorySection.dart';
import 'package:laborator2/CleanArchitecture/Presentation/Header/HeaderSection.dart';
import 'package:laborator2/CleanArchitecture/Presentation/SearchField.dart';
import 'package:laborator2/CleanArchitecture/Presentation/WineSection/SubCategorySection.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String selectedCategory = 'type';
  String selectedSubCategory = '';

  @override
  void initState() {
    super.initState();
  }

  void updateCategory(String newCategory) {
    print("Valoarea category primită în ShopPage: $newCategory");
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
      body: Obx(() {
        if (wineController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (wineController.winesBy.isEmpty) {
          return Center(child: Text("Nu există date pentru această categorie"));
        }

        return SingleChildScrollView(
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
                carouselData: wineController.carousel,
                wineData: wineController.winesBy,
                updateCategory: updateCategory,
                onItemSelected: onItemSelected,
              ),
              SubCategorySection(
                selectedSubCategory: selectedSubCategory,
                selectedCategory: selectedCategory,
              ),
            ],
          ),
        );
      }),
    );
  }
}
