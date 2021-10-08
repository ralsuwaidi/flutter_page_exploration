import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  final Function setFilter;
  final Map<String, bool> currentFilters;

  TabsScreen({this.availableMeals, this.currentFilters, this.setFilter = null});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> _pages = [
      {'page': CategoriesScreen(widget.availableMeals), 'title': 'Categories'},
      {'page': FavouriteScreen(), 'title': 'Favourites'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body: _pages[_selectPageIndex]['page'],
      drawer: MainDrawer(
          currentFilters: widget.currentFilters, setFilter: widget.setFilter),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
      ),
    );
  }
}
