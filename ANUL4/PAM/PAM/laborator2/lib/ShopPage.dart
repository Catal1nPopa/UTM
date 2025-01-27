import 'package:flutter/material.dart';
import 'components/HeaderSection.dart';
import 'components/SearchField.dart';
import 'components/CategorySection.dart';
import 'components/SubCategorySection.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String selectedCategory = 'Type';
  String selectedSubcategory = 'RedWine';

  final Map<String, List<Map<String, dynamic>>> dataMap = {
    'Type': [
      {
        'image':
            'https://avatars.mds.yandex.net/i?id=67cd37c7fb241ec482b91b9cafef90da_l-4303590-images-thumbs&n=13',
        'cantitate_produs': 10,
        'denumire': 'Vin Alb',
      },
      {
        'image':
            'https://avatars.mds.yandex.net/i?id=79607b26afe8664d473f2cf7ec3eb63573ce2af9-12423213-images-thumbs&n=13',
        'cantitate_produs': 15,
        'denumire': 'Vin Rosu',
      },
      {
        'image':
            'https://avatars.mds.yandex.net/i?id=67cd37c7fb241ec482b91b9cafef90da_l-4303590-images-thumbs&n=13',
        'cantitate_produs': 10,
        'denumire': 'Vin Alb',
      },
      {
        'image':
            'https://avatars.mds.yandex.net/i?id=2246b6f17ac500313d79e8d8eb78c555_l-5286572-images-thumbs&ref=rim&n=13&w=2198&h=3000',
        'cantitate_produs': 15,
        'denumire': 'Vin Rosu',
      },
    ],
    'Style': [
      {
        'image':
            'https://avatars.mds.yandex.net/get-mpic/1673800/img_id4547342334626229592.jpeg/orig',
        'cantitate_produs': 5,
        'denumire': 'Vin Rose',
      },
    ],
    'Countries': [
      {
        'image':
            'https://avatars.mds.yandex.net/i?id=c668402b7522192fa5aba879761bca7e_l-5194260-images-thumbs&n=13',
        'cantitate_produs': 8,
        'denumire': 'Feteasca',
      },
    ],
    'Grape': [
      {
        'image':
            'https://avatars.mds.yandex.net/i?id=c668402b7522192fa5aba879761bca7e_l-5194260-images-thumbs&n=13',
        'cantitate_produs': 20,
        'denumire': 'Cabernet',
      },
    ],
  };

  final Map<String, List<Map<String, dynamic>>> items = {
    'Type': [
      {
        'name': 'Ocone Bozzovich Beneventano Bianco IGT,',
        'type': 'Red Wine',
        'country': 'France',
        'grape': 'Green',
        'price': '53453',
        'capacity': '970',
        'scores': '52',
        'image':
            'https://avatars.mds.yandex.net/i?id=79607b26afe8664d473f2cf7ec3eb63573ce2af9-12423213-images-thumbs&n=13'
      },
      {
        'name': '2021 Petit Chablis - Passy Le Clou,',
        'type': 'White dWine',
        'country': 'France',
        'grape': 'Pink',
        'price': '444',
        'scores': '55',
        'capacity': '720',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPknajR5UxRUs1-cRvJ5wR1gw7VRhuJny7wR-7U9thBP0lU52Y34xQ9I3ZGJgsAVgbSUk&usqp=CAU'
      },
      {
        'name': 'Philippe Fontaine Champagne Brut Rose, Rose de Saignee, NV',
        'type': 'Sparkling wine',
        'country': 'Moldova',
        'grape': 'Green',
        'price': '2342',
        'scores': '79',
        'capacity': '330',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNpd2SspKwEgr3LDdGLNvMF0KPWB10vdz8gg&s'
      },
      {
        'name': 'Ocone Bozzovich Beneventano Bianco IGT,',
        'type': 'RedWine',
        'country': 'France',
        'grape': 'green',
        'price': '222',
        'scores': '25',
        'capacity': '777',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEXnajTgVQNt3re03exriAKjqKjszHdleIEA&s'
      },
      {
        'name': 'Ocone Bozzovich Beneventano Bianco IGT,',
        'type': 'RedWine',
        'country': 'France',
        'grape': 'green',
        'price': '5343',
        'capacity': '970',
        'scores': '95',
        'image':
            'https://hallmarkchannelwines.com/cdn/shop/files/hallmark-channel-wines-sparkle-sparkling-wine_6357e358-e2db-4358-bdd0-2a18158eab4b_1200x.png?v=1684431204'
      },
      {
        'name': 'Ocone Bozzovich Beneventano Bianco IGT,',
        'type': 'RedWine',
        'country': 'France',
        'grape': 'green',
        'price': '534',
        'capacity': '660',
        'scores': '88',
        'image':
            'https://minuman.com/cdn/shop/files/B_G-CUVEE-SPECIALE-ROUGE-SWEET-WINE.jpg?v=1700117745'
      },
      {
        'name': 'Ocone Bozzovich Beneventano Bianco IGT,',
        'type': 'RedWine',
        'country': 'France',
        'grape': 'green',
        'price': '5345',
        'scores': '66',
        'capacity': '70',
        'image':
            'https://cdn11.bigcommerce.com/s-a4amd7x8/images/stencil/1280x1280/products/8334/14995/5201__36048.1613026988.png?c=2'
      },
      {
        'name': 'Ocone Bozzovich Beneventano Bianco IGT,',
        'type': 'RedWine',
        'country': 'France',
        'grape': 'green',
        'price': '867',
        'capacity': '230',
        'scores': '88',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvJNE76Hxh39CNx-TkiVrB82hYxEjJxm63Yg&s'
      },
    ]
  };

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void updateSubcategory(String subcategory) {
    setState(() {
      selectedSubcategory = subcategory;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              dataMap: dataMap,
              updateCategory: updateCategory,
            ),
            const SizedBox(height: 20),
            SubCategorySection(
              items: items,
            ),
          ],
        ),
      ),
    );
  }
}
