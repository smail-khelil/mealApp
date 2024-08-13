import 'package:flutter/material.dart';

import '../data/damedata.dart';

import '../widgets/categorie_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of columns
            mainAxisSpacing:
                10, // spacing between rows because it's like columns,
            crossAxisSpacing:
                10, // spacing between columns because it's like rows,
            childAspectRatio: 3 / 2),
        children: [

          ...availableCategories.map((category) {
            return CategorieGridItem(
              category: category,
            );
          }),
        ],
      ),
    );
  }
}
