import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_items.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeal;
  FavoritesScreen(this.favoritedMeal);
  @override
  Widget build(BuildContext context) {
    return favoritedMeal.isEmpty
        ? Center(child: Text('No Favorites added yet!'))
        : Center(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItems(
                  id: favoritedMeal[index].id,
                  title: favoritedMeal[index].title,
                  affordability: favoritedMeal[index].affordability,
                  complexity: favoritedMeal[index].complexity,
                  duration: favoritedMeal[index].duration,
                  imageUrl: favoritedMeal[index].imageUrl,
                );
                // return Text(
                //   categoryMeals[index].title,
                //   style: TextStyle(color: Theme.of(context).accentColor),
                // );
              },
              itemCount: favoritedMeal.length,
            ),
          );
  }
}
