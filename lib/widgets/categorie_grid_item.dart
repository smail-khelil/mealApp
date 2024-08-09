// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:mealapp_4/models/Categories.dart';
import 'package:mealapp_4/screens/meal_screen.dart';


import '../providers/meals_provider.dart';

class CategorieGridItem extends ConsumerStatefulWidget {
   const CategorieGridItem({super.key,

    required this.category,

    required this.filters,
  });

  final Category category;

  final Map<String, bool> filters;

  @override
  ConsumerState<CategorieGridItem> createState() => _CategorieGridItemState();
}

class _CategorieGridItemState extends ConsumerState<CategorieGridItem> {
  @override
  Widget build(BuildContext context) {
    final mealrefProvider = ref.watch(mealProvider);
    return GestureDetector(
      onTap: () {
        var dataF = mealrefProvider.where((meal) {
          return meal.categories.contains(widget.category.id);
        }).toList();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MealScreen(
                titleCatgory: widget.category.title,
                displayedMeals: dataF,

                filters: widget.filters,
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
              widget.category.color.withOpacity(0.7),
              widget.category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(widget.category.title, style: GoogleFonts.acme(fontSize: 20)),
      ),
    );
  }
}
