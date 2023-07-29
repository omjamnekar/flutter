import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app/poviders/meals_provider.dart';
// import 'package:multiscreen_app/screens/';

enum Filter {
  glutenFree,
  lactoseFree,
  vegantarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegantarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
//   state[filter] = isActive // not allowed !=> mutating state
    state = {
      // ...sprade operator
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }

    if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }

    if (activeFilter[Filter.vegantarian]! && !meal.isVegetarian) {
      return false;
    }

    if (activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
