import 'package:flutter/material.dart';
// import 'package:multiscreen_app/screens/tabs.dart';
// import 'package:multiscreen_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app/poviders/filter_provider.dart';

// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegantarian,
//   vegan,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  // final Map<Filter, bool> currentFilters;

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _gluttenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _veganFilterSet = false;
//   var _vegetarianFilterSet = false;

//   @override
//   void initState() {
//     super.initState();
//     final activeFilters = ref.read(filtersProvider);
//     _gluttenFreeFilterSet = activeFilters[Filter.glutenFree]!;
//     _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
//     _vegetarianFilterSet = activeFilters[Filter.lactoseFree]!;
//     _veganFilterSet = activeFilters[Filter.vegan]!;
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (indentifier) {
      //   Navigator.of(context).pop();
      //   if (indentifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body:
          // WillPopScope(
          // //   onWillPop: () async {
          // //     ref.read(filtersProvider.notifier).setFilters({
          // //       Filter.glutenFree: _gluttenFreeFilterSet,
          // //       Filter.lactoseFree: _lactoseFreeFilterSet,
          // //       Filter.vegantarian: _vegetarianFilterSet,
          // //       Filter.vegan: _veganFilterSet,
          // //     });
          // //     // Navigator.of(context).pop();
          // //     return true;
          // //   },
          //   child:
          Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            // _gluttenFreeFilterSet,
            onChanged: (ischeck) {
              // setState(() {
              //   _gluttenFreeFilterSet = ischeck;
              // });

              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, ischeck);
            },
            title: Text(
              'Gluten-free.',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            // _gluttenFreeFilterSet,
            onChanged: (ischeck) {
              // setState(() {
              //   _gluttenFreeFilterSet = ischeck;
              // });

              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, ischeck);
            },
            title: Text(
              'Lactose-free.',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegantarian]!,
            // _gluttenFreeFilterSet,
            onChanged: (ischeck) {
              // setState(() {
              //   _gluttenFreeFilterSet = ischeck;
              // });

              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegantarian, ischeck);
            },
            title: Text(
              'Vegatarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegeterian meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            // _gluttenFreeFilterSet,
            onChanged: (ischeck) {
              // setState(() {
              //   _gluttenFreeFilterSet = ischeck;
              // });

              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, ischeck);
            },
            title: Text(
              'vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
