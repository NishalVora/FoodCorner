import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
      //    Navigator.of(ctx).push(
      //   MaterialPageRoute(
      //     builder: (_) {
      //       return CategoryMealsScreen(id,title);
      //     },
      //   ),
      // );
    );
  }

  CategoryItems(this.id, this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return selectCategory(context);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
