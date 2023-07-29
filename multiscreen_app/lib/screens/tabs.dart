import 'package:flutter/material.dart';
// import 'package:multiscreen_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app/poviders/favorites_provider.dart';
// import 'package:multiscreen_app/povider/meals_provider.dart';
import 'package:multiscreen_app/screens/categories.dart';
import 'package:multiscreen_app/screens/filter.dart';
import 'package:multiscreen_app/screens/meals.dart';
//import 'package:multiscreen_app/models/meal.dart';
import 'package:multiscreen_app/widgets/main_drawer.dart';
// import 'package:multiscreen_app/povider/favorites_provider.dart';
import 'package:multiscreen_app/poviders/filter_provider.dart';

const kInitiallFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegantarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => TabsScreenState();
}

class TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favoriteMeals = [];
  // Map<Filter, bool> _selectedFilters = kInitiallFilters;

  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //       _showInfoMessage('Meal is no longer a favorite.');
  //     });
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //       _showInfoMessage('Marked as favorite.');
  //     });
  //   }
  // }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String indentifier) async {
    Navigator.of(context).pop();
    if (indentifier == 'filters') {
      // final result =
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(
              // currentFilters: _selectedFilters,
              ),
        ),
      );

      //     setState(() {
      //       _selectedFilters = result ?? kInitiallFilters;
      //     });
      //   }
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    // final meals = ref.watch(mealsProvider);
    // final activeFilter = ref.watch(filtersProvider);
    //  final availableMeals =dummymeal.where((meal)
    // River pod feature
    // final availableMeals = meals.where((meal) {
    //   if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }

    //   if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }

    //   if (activeFilter[Filter.vegantarian]! && !meal.isVegetarian) {
    //     return false;
    //   }

    //   if (activeFilter[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }).toList();

    Widget activepage = CategoriesScreen(
      // onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePagetitle = 'Catergories';

    if (_selectedPageIndex == 1) {
      final favoritesMeals = ref.watch(favoriteMealsProvider);
      activepage = MealsScreen(
        meals: favoritesMeals,
        // onToggleFavorite: _toggleMealFavoriteStatus,
      );

      activePagetitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePagetitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
}
