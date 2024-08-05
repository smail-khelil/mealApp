// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp_4/data/damedata.dart';
import 'package:mealapp_4/models/Categories.dart';
import 'package:mealapp_4/screens/meal_screen.dart';

import '../models/meal.dart';

class CategorieGridItem extends StatelessWidget {
  const CategorieGridItem({
    Key? key,
    required this.category, required this.toggleFavorite, required this.filters,
  }) : super(key: key);

  final Category category;
  final Function (Meal meal) toggleFavorite;
  final Map <String,bool>filters;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var dataF = availableMeals.where((meal) {

          return meal.categories.contains(category.id);

        }).toList();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return
                MealScreen(
                  titleCatgory: category.title, displayedMeals: dataF, tpggelFavorite: toggleFavorite, filters: filters ,
                );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(category.title, style: GoogleFonts.acme(fontSize: 20)),
      ),
    );
  }
}
