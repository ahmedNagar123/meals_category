import 'package:deli_meals/dummy_data.dart';
import 'package:deli_meals/module/meals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void toggleFavorite(String mealId) {
    final existIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  void setFilters(Map<String, bool> dataFilters) {
    setState(() {
      _filters = dataFilters;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      routes: {
        '/': (context) => TabsScreen(
              favoriteMeal: _favoriteMeals,
            ),
        CategoryMealsScreen.nameOfScreen: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.nameOfScreen: (context) => MealDetailScreen(
              toggleFavorite: toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        FiltersScreen.nameOfScreen: (context) => FiltersScreen(
              currentFilter: _filters,
              saveData: setFilters,
            )
      },
    );
  }
}
