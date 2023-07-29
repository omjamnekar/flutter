// import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formtest/data/categories.dart';
import 'package:formtest/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:formtest/models/grocery_item.dart';
// import 'package:formtest/widgets/grocery_list.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredvQuantity = 1;
  var _selecteCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      //operating the data backend
      final url = Uri.https(
          'first-672a2-default-rtdb.firebaseio.com', 'shopping-list.json');

      // inserting of data inside the database
      final responce = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },

        //formating of data
        body: json.encode(
          {
            'name': _enteredName,
            'quantity': _enteredvQuantity,
            'category': _selecteCategory.title,
          },
        ),
      );

      final Map<String, dynamic> resData = json.decode(responce.body);
      // Navigator.of(context).pop(
      //   GroceryItem(
      //     id: DateTime.now().toString(),
      //     name: _enteredName,
      //     quantity: _enteredvQuantity,
      //     category: _selecteCategory,
      //   ),
      // );

      // print(responce.body);
      // print(responce.statusCode);

      // even if the form isnt filled and by back
      // button ,we can change screen to the back
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop(
        GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: _enteredvQuantity,
          category: _selecteCategory,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text(" Name"),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 abd 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ), // instead of TextField()

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Quantity"),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be valid, positive number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // parse will return value in number
                        //and if it unable to do that it will throw an error
                        _enteredvQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                    height: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selecteCategory,
                      items: [
                        for (final category in categories.entries)

                          // categories is the type of Map due  e.g.(category = {})
                          // to which for converting it we use enteries and it wil convert into list
                          DropdownMenuItem(
                              value: category.value,
                              child: Row(children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  category.value.title,
                                  // style: const TextStyle(fontSize: 22),
                                ),
                              ]))
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selecteCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSending
                        ? null
                        : () {
                            _formKey.currentState!.reset();
                          },
                    child: const Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: _isSending ? null : _saveItem,
                    child: _isSending
                        ? SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Add Item"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
