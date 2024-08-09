import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp_4/models/meal.dart';

class FavoritMealNotifier extends StateNotifier<List<Meal>> {
  FavoritMealNotifier() : super([]);

  bool toggelFavoriteMeal(Meal meal) {
    final existingIndex = state.indexWhere((element) => element.id == meal.id);
    state.forEach((element) {
      print('page home: ${element.title}');
    });

    if (existingIndex >= 0) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteProvider = StateNotifierProvider<FavoritMealNotifier, List<Meal>>(
    (ref) => FavoritMealNotifier());
