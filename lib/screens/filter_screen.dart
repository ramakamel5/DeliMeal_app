import '../widgets/drawer.dart';
import 'package:flutter/material.dart';

class FilteScreen extends StatefulWidget {
  static const routeName = '/filter';

  final dynamic saveFilters;
  final Map<String, bool> currentFilters;

  FilteScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilteScreen> createState() => _FilteScreenState();
}

class _FilteScreenState extends State<FilteScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten']!;
    _lactosFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegatarian']!;
    super.initState();
  }

  Widget _buildSwitchListTitle(
    String title,
    String description,
    bool currentValue,
    dynamic updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactosFree,
                  'vegan': _vegan,
                  'vegatarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTitle(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTitle(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _vegetarian,
                    (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTitle(
                    'Vegan',
                    'Only include Vegan meals',
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTitle(
                    'LactosFree',
                    'Only include lactosFree meals',
                    _lactosFree,
                    (newValue) {
                      setState(() {
                        _lactosFree = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
