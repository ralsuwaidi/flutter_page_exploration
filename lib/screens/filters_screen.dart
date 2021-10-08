import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilter;
  FiltersScreen({this.setFilter = null});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchFilter(
      {bool filter,
      String title,
      String description,
      Function updateFunction}) {
    return SwitchListTile(
        title: Text(title),
        value: filter,
        subtitle: Text(description),
        onChanged: updateFunction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          Icon(Icons.save),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline5),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchFilter(
                  filter: _glutenFree,
                  title: 'Gluten-free',
                  description: 'Only include gluten-free meals',
                  updateFunction: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchFilter(
                  filter: _lactoseFree,
                  title: 'Lactose-free',
                  description: 'Only include lactose-free meals',
                  updateFunction: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchFilter(
                  filter: _vegan,
                  title: 'Vegan',
                  description: 'Only include vegan meals',
                  updateFunction: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchFilter(
                  filter: _vegetarian,
                  title: 'Vegetarian',
                  description: 'Only include vegetarian meals',
                  updateFunction: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
