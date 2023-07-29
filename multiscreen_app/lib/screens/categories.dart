import 'package:flutter/material.dart';
import 'package:multiscreen_app/data/dummy_data.dart';
import 'package:multiscreen_app/screens/meals.dart';
import 'package:multiscreen_app/models/meal.dart';
import 'package:multiscreen_app/widgets/category_grid_item.dart';
// ignore: library_prefixes
import 'package:multiscreen_app/models/category.dart' as MyCategory;

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    // required this.onToggleFavorite,
    required this.availableMeals,
  });

  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// with is the key word use as mix in class for marging other class
// SingleTickerProviderStateMixin is use for single  animation
// TickerProviderStateMixin is use for more then one animation

// class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // late: it will have the value in future as soon as the programe excecuted it will have it
  // animationcontroler is the type of class controle animetion
  late AnimationController _animetioncontroller;

  @override
  void initState() {
    super.initState();

    _animetioncontroller = AnimationController(
      //it will ensure THE ANIMATION SHOULD BE exicute
      //60TIMES PER SECONDS
      vsync: this,
      duration: const Duration(milliseconds: 300),
      //lowerbound and upperbound is work as the true and false value (optional)
      lowerBound: 0,
      upperBound: 1,
    );

    // _animetioncontroller.stop();
    //stop the animation
    // _animetioncontroller.repeat();
    //repeat the animetion
    _animetioncontroller.forward();
  }

  @override
  void dispose() {
    _animetioncontroller.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, MyCategory.Category category) {
    final filterMeals = widget.availableMeals
        //  dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Navigator.push(context, route)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filterMeals,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
    //navigator.push(context,route)
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animetioncontroller,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ), //1.5
        children: [
          for (final category in availableCategories)

            //availableCastegories.map((category)=> CategoryGridItem(category:category))
            CategoryGridItem(
              category: category,
              onSelectCategorty: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) =>
          //Finetuing Explicite animation
          SlideTransition(
        // position: _animetioncontroller.drive(
        //   //Tween: as its name it handle the animation in between two objects
        //   Tween(
        //     begin: const Offset(0, 0.3),
        //     end: const Offset(0, 0),
        //   ),
        // ),

        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        )
            //Here the animate use for animation
            .animate(
          CurvedAnimation(
            parent: _animetioncontroller,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );

    //altarnative mathod

    // Padding(
    //   padding: EdgeInsets.only(
    //     top: 100 - _animetioncontroller.value * 100,
    //   ),
    //   child: child,
    // ),
    // );
  }
}
