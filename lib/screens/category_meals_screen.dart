import 'package:deli_meals/module/meals.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String nameOfScreen = '/category-meals-screen';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  var _loadedInitData = false;

  void removeItem(String id) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final data =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final id = data['id'];
      categoryTitle = data['title'];
      displayMeals = widget.availableMeals.where((element) {
        return element.categories.contains(id);
      }).toList();
      _loadedInitData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration: displayMeals[index].duration,
              // affordability: mealsId[index].affordability,
              // complexity: mealsId[index].complexity,
            );
          },
          itemCount: displayMeals.length,
        ),
      ),
    );
  }
}
