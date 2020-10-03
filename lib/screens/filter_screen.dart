import 'package:deli_meals/drawer_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String nameOfScreen = '/filters-screen';
  final Map<String, bool> currentFilter;
  final Function saveData;

  FiltersScreen({this.currentFilter, this.saveData});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _vegan = false;
  var _vegetarian = false;
  var _glutenFree = false;
  var _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
  }

  Widget buildSwitchListTile(
    String title,
    String description,
    bool value,
    Function function,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMain(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveData(selectedFilters);
            },
          ),
        ],
        title: Text('filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Vegan',
                  'only include vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'only include Vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'GlutenFree',
                  'only include GlutenFree meals',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'LactoseFree',
                  'only include LactoseFree meals',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
