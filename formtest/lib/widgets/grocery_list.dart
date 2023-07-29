import 'package:flutter/material.dart';
import 'package:formtest/data/categories.dart';
import 'dart:convert';
// import 'package:formtest/data/dummy_item.dart';
import 'package:formtest/models/grocery_item.dart';
import 'package:formtest/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  String? _error;
  bool _isloading = false;

  // Future is non nullable datatype due to which late is used
  // late Future<List<GroceryItem>> _loadedItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loadedItems = _loadItem();
    _loadItem();
  }

  // Future<List<GroceryItem>> _loadItem() async {
  void _loadItem() async {
    final url = Uri.https(
        'first-672a2-default-rtdb.firebaseio.com', 'shopping-list.json');

    try {
      final response = await http.get(url);

      if (response.body == 'null') {
        setState(() {
          _isloading = true;
        });
        // return [];
        return;
      }

      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });
        // throw Exception('Failed to Fatch, Please try again later!');
      }

      final Map<String, dynamic> ListData =
          //  map   string             string              dynamic     dynamic
          //{"-NXBREQX2qp6V5tYE2H_":{"category":"Dairy","name":"gh","quantity":12}}
          json.decode(response.body);
      final List<GroceryItem> loadedItem = [];
      for (final item in ListData.entries) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.title == item.value['category'])
            .value;
        loadedItem.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
          ),
        );
      }

      // return loadedItem;
      setState(() {
        _groceryItems = loadedItem;
        _isloading = true;
      });
    } catch (error) {
      setState(() {
        _error = 'Somthing went wrong! Please try again later.';
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });

    _loadItem();

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https('first-672a2-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(" Try adding New items"),
        ],
      ),
    );

    if (!_isloading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_groceryItems[index].id),
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    if (_error != null) {
      Widget content = Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_error!),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('your Groceries'),
        actions: [
          IconButton(
            onPressed: () {
              _addItem();
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: content,
      // FutureBuilder(
      //   future: _loadedItems,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Column(
      //           // mainAxisAlignment: MainAxisAlignment.center,
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Text(snapshot.error.toString()),
      //           ],
      //         ),
      //       );
      //     }

      //     if (snapshot.data == null || snapshot.data!.isEmpty) {
      //       print(snapshot.data);
      //       return const Center(
      //         child: Column(
      //           // mainAxisAlignment: MainAxisAlignment.center,
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Text(" Try adding New items"),
      //           ],
      //         ),
      //       );
      //     }

      //     return ListView.builder(
      //       itemCount: snapshot.data!.length,
      //       itemBuilder: (ctx, index) => Dismissible(
      //         key: ValueKey(snapshot.data![index].id),
      //         onDismissed: (direction) {
      //           _removeItem(snapshot.data![index]);
      //         },
      //         child: ListTile(
      //           title: Text(snapshot.data![index].name),
      //           leading: Container(
      //             width: 24,
      //             height: 24,
      //             color: snapshot.data![index].category.color,
      //           ),
      //           trailing: Text(
      //             snapshot.data![index].quantity.toString(),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
