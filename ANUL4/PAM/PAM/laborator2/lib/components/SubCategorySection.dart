import 'package:flutter/material.dart';

class SubCategorySection extends StatefulWidget {
  const SubCategorySection({Key? key, required this.items}) : super(key: key);

  final Map<String, List<Map<String, dynamic>>> items;

  @override
  _SubCategorySectionState createState() => _SubCategorySectionState();
}

class _SubCategorySectionState extends State<SubCategorySection> {
  // Starea pentru a ține evidența butoanelor favorite
  final Map<int, bool> favouriteStates = {};

  @override
  Widget build(BuildContext context) {
    final typeItems = widget.items['Type'] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Wine',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
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
          itemCount: typeItems.length,
          itemBuilder: (context, index) {
            final item = typeItems[index];
            final isFavourite = favouriteStates[index] ?? false;

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
                          item['image'] ?? '',
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
                                color: const Color.fromARGB(255, 195, 228, 160),
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
                              item['name'] ?? '',
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
                                  item['type'] ?? '',
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
                                  item['country'] ?? '',
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
                        onPressed: () {
                          setState(() {
                            favouriteStates[index] = !isFavourite;
                          });
                        },
                        icon: Icon(
                          isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 16,
                          color: isFavourite
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : null,
                        ),
                        label: Text(
                          isFavourite ? 'Added' : 'Favourite',
                          style: TextStyle(
                              color: isFavourite
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 6, 3, 3)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isFavourite
                              ? const Color.fromARGB(255, 237, 6, 6)
                              : const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹ ${item['price'] ?? ''}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Bottle (${item['capacity'] ?? ''} ml)',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Critics Scores:  ${item['scores'] ?? ''}/100)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
