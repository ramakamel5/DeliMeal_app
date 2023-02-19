// ignore_for_file: non_constant_identifier_names

import 'package:delimeals_app/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import './categories_screen.dart';
import 'filter_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _nameState();
}

class _nameState extends State<TabsScreen> {
  int _selectedPagesIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPagesIndex = index;
    });
  }

  final List<Map<String, dynamic>> _Pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categoris',
    },
    {
      'page': FavoriteScreen(),
      'title': 'Categoris',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_Pages[_selectedPagesIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _Pages[_selectedPagesIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPagesIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorite',
            ),
          ]),
    );
  }
}
