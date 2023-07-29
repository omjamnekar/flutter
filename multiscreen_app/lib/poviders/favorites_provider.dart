import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:multiscreen_app/data/dummy_data.dart';
import 'package:multiscreen_app/models/meal.dart';

// here we cant romove or add new content in existing list
// either we have to delete it whole OR create new that will store new thing

class FavoriteMealsNotifiter extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifiter() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      //where can be use to filter the list and give NEW list
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifiter, List<Meal>>((ref) {
  return FavoriteMealsNotifiter();
});
