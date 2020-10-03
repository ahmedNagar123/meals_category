import 'package:deli_meals/screens/filter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up !',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTileWidget(
            icon: Icons.restaurant,
            title: 'Meals',
            function: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTileWidget(
            icon: Icons.settings,
            title: 'Filters',
            function: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.nameOfScreen);
            },
          )
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;

  const ListTileWidget({this.icon, this.title, this.function});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
        ),
      ),
      onTap: function,
    );
  }
}
