import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealapp_4/screens/meal_screen.dart';


import '../widgets/main_drawer.dart';
import 'categories_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // use provider of filter

    //this is the way to get the data from the provider <of the favorite meals>
    // final toggelFavoriteMeal = ref.watch(favoriteProvider);

    Widget page = const CategoriesScreen();
    var pageTitle = 'Choose your meal';

    // control the page to be displayed
    if (_selectedPageIndex == 1) {
      page = MealScreen(
        titleCatgory: null,
      );
      pageTitle = 'Favorites';
    } else {
      page = const CategoriesScreen();
    }

    return Scaffold(
      drawer: MainDrawer(selectPage: _selectPage),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_sharp),
            onPressed: () {},
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
