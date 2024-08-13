
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealapp_4/models/meal.dart';
import 'package:mealapp_4/widgets/meal_item.dart';

import '../providers/favorite_provider.dart';
import '../providers/filter_provider.dart';
import 'detile_meal_screen.dart';

class MealScreen extends ConsumerWidget {
  MealScreen({
    super.key,
    required this.titleCatgory,

  });

  final String? titleCatgory;


  late List<Meal> dataDisplayed = [];


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(titleCatgory == null){
      dataDisplayed = ref.watch(favoriteProvider);
    }else{
      dataDisplayed = ref.watch(filteredMealProvider);
    }


    log('filteredData: ${dataDisplayed.length}');
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
          children: dataDisplayed
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
