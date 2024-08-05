import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mealapp_4/models/meal.dart';

import 'package:mealapp_4/screens/meal_screen.dart';

import '../widgets/main_drawer.dart';
import 'categories_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Meal> _favoriteMeals = [];

  void toggelFavoriteMeal(Meal meal) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == meal.id);
    _favoriteMeals.forEach((element) {
      print('page home: ${element.title}');
    });

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final Map <String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  @override
  Widget build(BuildContext context) {

    Widget page = CategoriesScreen(toggleFavorite: toggelFavoriteMeal,filters: _filters);
    var pageTitle = 'Choose your meal';

    // control the page to be displayed
    if (_selectedPageIndex == 1) {
      page = MealScreen(
          displayedMeals: _favoriteMeals,
          titleCatgory: null,
          tpggelFavorite: toggelFavoriteMeal,filters: _filters);
      pageTitle = 'Favorites';
    } else if (_selectedPageIndex == 2) {
      // page = FilterScreen();
      // pageTitle = 'Filters';
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => const FilterScreen()
      //   ),
      // );

    } else {
      page = CategoriesScreen(toggleFavorite: toggelFavoriteMeal,filters: _filters);
    }

    return Scaffold(
      drawer: MainDrawer(selectPage: _selectPage, filters: _filters),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_sharp),
            onPressed: () {
           log(_filters.toString());

            },
          )
        ],

        title: Text(pageTitle),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );

  }
}
