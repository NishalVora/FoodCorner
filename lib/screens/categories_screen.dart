import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      children: DUMMY_CATEGORIES.map(
        (catData) {
          return CategoryItems(
            catData.id,
            catData.title,
            catData.color,
          );
        },
      ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
    );
  }
}
