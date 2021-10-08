import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  final Function setFilter;
  final Map<String, bool> currentFilters;

  MainDrawer({this.currentFilters, this.setFilter = null});

  Widget buildListTile(String title, Widget icon, Function tapHandler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Meals',
            Icon(Icons.restaurant),
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) {
                    return TabsScreen();
                  },
                ),
              );
            },
          ),
          buildListTile(
            'Filter',
            Icon(Icons.settings),
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) {
                    return FiltersScreen(
                      setFilter: setFilter,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
