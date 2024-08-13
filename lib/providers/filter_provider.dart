import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/damedata.dart';
import '../models/Categories.dart';
import '../models/meal.dart';


class FilterNotifier extends StateNotifier<Map<String, bool>> {
  // this is constructor to initialize the state
  FilterNotifier()
      : super({
          'gluten': false,
          'lactose': false,
          'vegetarian': false,
          'vegan': false,
        });

// this is the function to set the filter
  void setFilter(String key, bool value) {
    state = {...state, key: value};
  }

  // this is the function to set new filters
  void setFilters(Map<String, bool> filters) {
    state = filters;
  }
}

//this for use class
final filterProvider = StateNotifierProvider<FilterNotifier, Map<String, bool>>(
    (ref) => FilterNotifier());

class Filter_Categoery_Notifier extends StateNotifier<List<Meal>> {
  Filter_Categoery_Notifier()
      : super([
          ...availableMeals,
        ]);

  void getCategoryFilter(Category category) {
    state = availableMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
  }
}

final filterCategoryProvider =
    StateNotifierProvider<Filter_Categoery_Notifier, List<Meal>>(
        (ref) => Filter_Categoery_Notifier());

final filteredMealProvider = Provider<List<Meal>>((ref) {
  final displayedMeals = ref.watch(filterCategoryProvider);
  final filters = ref.watch(filterProvider);

  return displayedMeals.where((meal) {
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
});
