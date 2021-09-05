import 'package:flutter/material.dart';
import 'package:Food_Corner/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealID == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                          radius: 20,
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(mealID) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavorite(mealID);
        },
      ),
    );
  }
}
