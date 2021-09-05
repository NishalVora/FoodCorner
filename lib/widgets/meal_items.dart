import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
 

  MealItems({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id).then(
      (value) {
        if (value != null) {
          // removedItem(value);
        }
      },
    );
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return MealDetailScreen();
    //     },
    //   ),
    // );
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        margin: EdgeInsets.all(15),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.title,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text(
                        '${duration}minutes',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 5),
                      Text(
                        complexityText,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text(
                        affordabilityText,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
