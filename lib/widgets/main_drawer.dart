


import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key, required this.selectPage});
final void Function(int) selectPage;

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
           DrawerHeader(

            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient (
                  colors: [
                    Colors.red.withOpacity(0.8),
                    Colors.purple.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),

              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Icon(
                    Icons.fastfood_outlined
                   ,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Cooking Up!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListTile(leading: const Icon(Icons.restaurant),
            title: const Text('Meals'),
            onTap: () {
              Navigator.of(context).pop();
              widget.selectPage(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_alt_sharp),
            title: const Text('Filters'),
            onTap: () {
              Navigator.of(context).pop();
              // selectPage(2);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FilterScreen()
                ),
              ).then((value) {
                if(value != null){
                  print(value);
                }

              });
            },

          ),
          ListTile(
            leading: const Icon(Icons.favorite,color: Colors.red,),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.of(context).pop();
              widget.selectPage(1);
            },
          ),
        ],

      ),

    );
  }
}
