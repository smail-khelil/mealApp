

import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var lactoseFree = false;
  var vegetarian = false;
  var vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegetarian': vegetarian,
                'vegan': vegan,
              };

              Navigator.of(context).pop(selectedFilters);
            },
          )
        ],
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          final selectedFilters = {
            'gluten': glutenFree,
            'lactose': lactoseFree,
            'vegetarian': vegetarian,
            'vegan': vegan,
          };

          Navigator.of(context).pop(selectedFilters);
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                filterListSwitch(context, 'Gluten-free',
                    'Only include gluten-free meals', glutenFree, (newValue) {
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                filterListSwitch(context, 'Lactose-free',
                    'Only include lactose-free meals', lactoseFree, (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                }),
                filterListSwitch(context, 'Vegetarian',
                    'Only include vegetarian meals', vegetarian, (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                filterListSwitch(
                    context, 'Vegan', 'Only include vegan meals', vegan,
                    (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ),
      ),
    );
  }

  SwitchListTile filterListSwitch(BuildContext context, String title,
      String subtitle, currentValue, Function(bool value) updateValueF) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValueF,
    );
  }
}
