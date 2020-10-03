import 'package:deli_meals/module/meals.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String nameOfScreen = '/meals-detail-screen';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen({this.toggleFavorite, this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final  id = ModalRoute.of(context).settings.arguments as String;
    final mealsId = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${mealsId.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealsId.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'ingredients',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            BuildIngredients(mealsId: mealsId),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'steps',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            BuildSteps(mealsId: mealsId)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(id),
        child: Icon(
          isFavorite(id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}

class BuildSteps extends StatelessWidget {
  const BuildSteps({
    Key key,
    @required this.mealsId,
  }) : super(key: key);

  final Meal mealsId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                title: Text(mealsId.steps[index]),
                leading: CircleAvatar(
                  child: Text('# ${index + 1}'),
                ),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          );
        },
        itemCount: mealsId.steps.length,
      ),
    );
  }
}

class BuildIngredients extends StatelessWidget {
  const BuildIngredients({
    Key key,
    @required this.mealsId,
  }) : super(key: key);

  final Meal mealsId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Text(mealsId.ingredients[index]),
            ),
          );
        },
        itemCount: mealsId.ingredients.length,
      ),
    );
  }
}
