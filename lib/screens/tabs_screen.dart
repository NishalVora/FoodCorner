import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
  final List<Meal> favoritedMeal;
  TabsScreen(this.favoritedMeal);
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  initState() {
    _pages = [
      {
        'title': 'Categories',
        'Page': CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'Page': FavoritesScreen(widget.favoritedMeal),
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              _pages[_selectedPageIndex]['title'],
            ),
          ),
          drawer: MainDrawer(),
          body: _pages[_selectedPageIndex]['Page'],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Colors.white,
            currentIndex: _selectedPageIndex,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            // type: BottomNavigationBarType.shifting,
            onTap: _selectedPage,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                title: Text('Categories'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text('Favorites'),
              ),
            ],
            backgroundColor: Theme.of(context).primaryColor,
          )),
    );
  }
}
