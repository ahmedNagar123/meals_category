import 'package:deli_meals/drawer_main.dart';
import 'package:deli_meals/module/meals.dart';
import 'package:deli_meals/screens/category_screen.dart';
import 'package:deli_meals/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TabsScreen({this.favoriteMeal});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _page;
  int selectPageIndex = 0;

  @override
  void initState() {
    _page = [
      {
        'page': CategoryScreen(),
        'title': 'category',
      },
      {
        'page': FavoriteScreen(
          favoriteMeal: widget.favoriteMeal,
        ),
        'title': 'favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[selectPageIndex]['title']),
      ),
      drawer: DrawerMain(),
      body: _page[selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('category')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('favorite')),
        ],
      ),
    );
  }
}
