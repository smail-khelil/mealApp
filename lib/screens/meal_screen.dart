// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mealapp_4/models/meal.dart';
import 'package:mealapp_4/widgets/meal_item.dart';

import 'detile_meal_screen.dart';

class MealScreen extends StatelessWidget {
   MealScreen({
    super.key,
    required this.titleCatgory,
    required this.displayedMeals,
    required this.filters,
  });



  final String? titleCatgory;
  final List<Meal> displayedMeals;

  final Map<String, bool> filters;
  late var filteredData = [];

  @override
  Widget build(BuildContext context) {
    filteredData = displayedMeals.where((meal) {
      if (filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      if (filters['vegan']! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    return titleCatgory == null
        // this is the case of the favorite page
        ? content(context)
        // this is the case of the meal page
        : Scaffold(
            appBar: AppBar(
              title: Text(titleCatgory!),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: filteredData
              .map(
                (meal) => MealItem(
                    meal: meal,
                    onSlectMeal: (meal) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetileMealScreen(meal: meal),
                        ),
                      );
                    }),
              )
              .toList()),
    );
  }
}
