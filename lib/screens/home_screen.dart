import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealapp_4/screens/meal_screen.dart';

import '../providers/page_provider.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectPage = ref.read(pageProvider.notifier).setPage;
    final selectedPageIndex = ref.watch(pageProvider);

    Widget page = const CategoriesScreen();
    var pageTitle = 'Choose your meal';

    // control the page to be displayed
    if (selectedPageIndex == 1) {
      page = MealScreen(
        titleCatgory: null,
      );
      pageTitle = 'Favorites';
    } else {
      page = const CategoriesScreen();
    }

    return Scaffold(
      drawer: MainDrawer(selectPage: selectPage),
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
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
