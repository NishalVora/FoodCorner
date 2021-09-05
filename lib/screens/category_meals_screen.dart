import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_items.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var isLoaded = false;
  @override
  void didChangeDependencies() {
    if (!isLoaded) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryID = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
      isLoaded = true;
      // TODO: implement didChangeDependencies

    }
    super.didChangeDependencies();
  }

  void deletedMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealID);
    });
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
            return MealItems(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              imageUrl: displayedMeals[index].imageUrl,
              
            );
            // return Text(
            //   categoryMeals[index].title,
            //   style: TextStyle(color: Theme.of(context).accentColor),
            // );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
