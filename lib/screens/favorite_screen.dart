import 'package:deli_meals/module/meals.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/cupertino.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoriteScreen({this.favoriteMeal});
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text(
          'you have no favorite yet - start adding some!',
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            // affordability: mealsId[index].affordability,
            // complexity: mealsId[index].complexity,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
