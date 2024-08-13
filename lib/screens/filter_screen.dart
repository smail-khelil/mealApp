// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../providers/filter_provider.dart';
//
// class FilterScreen extends ConsumerStatefulWidget {
//   const FilterScreen({super.key});
//
//   @override
//   ConsumerState<FilterScreen> createState() => _FilterScreenState();
// }
//
// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final refF = ref.watch(filterProvider.notifier);
//
//     var glutenFree = ref.watch(filterProvider)['gluten'];
//     var lactoseFree = ref.watch(filterProvider)['lactose'];
//     var vegetarian = ref.watch(filterProvider)['vegetarian'];
//     var vegan = ref.watch(filterProvider)['vegan'];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Filters'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: () {
//               final selectedFilters = {
//                 'gluten': glutenFree,
//                 'lactose': lactoseFree,
//                 'vegetarian': vegetarian,
//                 'vegan': vegan,
//               };
//
//               Navigator.of(context).pop(selectedFilters);
//             },
//           )
//         ],
//       ),
//       body: PopScope(
//         canPop: false,
//         onPopInvoked: (bool didPop)  {
//           if (didPop) {
//             return;
//           }
//
//           final selectedFilters = {
//             'gluten': glutenFree!,
//             'lactose': lactoseFree!,
//             'vegetarian': vegetarian!,
//             'vegan': vegan!,
//           };
//
//           Navigator.of(context).pop(selectedFilters);
//         },
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(20),
//               child: Text(
//                 'Adjust your meal selection',
//                 style: Theme.of(context).textTheme.headlineLarge,
//               ),
//             ),
//             Expanded(
//                 child: ListView(
//               children: [
//                 filterListSwitch(
//                     context,
//                     'Gluten-free',
//                     'Only include gluten-free meals',
//                     glutenFree, (bool newValue) {
//                   refF.setFilter('gluten', newValue);
//                   log('glutenFree: $glutenFree');
//                 }),
//                 filterListSwitch(context, 'Lactose-free',
//                     'Only include lactose-free meals', lactoseFree, (newValue) {
//                   refF.setFilter('lactose', newValue);
//
//                   log('lactoseFree: $lactoseFree');
//                 }),
//                 filterListSwitch(context, 'Vegetarian',
//                     'Only include vegetarian meals', vegetarian, (newValue) {
//                   refF.setFilter('vegetarian', newValue);
//                   log('vegetarian: $vegetarian');
//                 }),
//                 filterListSwitch(
//                     context, 'Vegan', 'Only include vegan meals', vegan,
//                     (newValue) {
//                   refF.setFilter('vegan', newValue);
//                   log('vegan: $vegan');
//                 }),
//               ],
//             ))
//           ],
//         ),
//         //    pop
//       ),
//     );
//   }
//
//   SwitchListTile filterListSwitch(
//     BuildContext context,
//     String title,
//     String subtitle,
//     bool? currentValue,
//     Function(bool) updateValue,
//   ) {
//     return SwitchListTile(
//       title: Text(title),
//       subtitle: Text(subtitle),
//       value: currentValue!,
//       onChanged: updateValue,
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  // late bool glutenFree = false;
  // late bool lactoseFree = false;
  // late bool vegetarian = false;
  // late bool vegan = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refF = ref.watch(filterProvider.notifier);

    var glutenFree = ref.watch(filterProvider)['gluten']!;
    var lactoseFree = ref.watch(filterProvider)['lactose']!;
    var vegetarian = ref.watch(filterProvider)['vegetarian']!;
    var vegan = ref.watch(filterProvider)['vegan']!;

    log('all filters: $glutenFree, $lactoseFree, $vegetarian, $vegan');
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
      body: Column(
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
                refF.setFilter('gluten', newValue);
              }),
              filterListSwitch(context, 'Lactose-free',
                  'Only include lactose-free meals', lactoseFree, (newValue) {
                refF.setFilter('lactose', newValue);

                lactoseFree = newValue;

                log('lactoseFree: $lactoseFree');
              }),
              filterListSwitch(context, 'Vegetarian',
                  'Only include vegetarian meals', vegetarian, (newValue2) {
                refF.setFilter('vegetarian', newValue2);

                log('vegetarian: $vegetarian');
              }),
              filterListSwitch(
                  context, 'Vegan', 'Only include vegan meals', vegan,
                  (newValue) {
                refF.setFilter('vegan', newValue);

                log('vegan: $vegan');
              }),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile filterListSwitch(BuildContext context, String title,
      String subtitle, bool? currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue!,
      onChanged: updateValue,
    );
  }

  SwitchListTile filterListSwitch2(BuildContext context, String title,
      String subtitle, bool? currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue!,
      onChanged: updateValue,
    );
  }
}
