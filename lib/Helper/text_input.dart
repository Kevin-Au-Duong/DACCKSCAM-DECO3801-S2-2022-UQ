import 'package:flutter/material.dart';
import 'package:frontend/Helper/globals.dart' as globals;

import 'friend.dart';


class TextInput extends StatefulWidget {
  const TextInput({super.key});

  @override
  State<TextInput> createState() => _TextInput();
}

class _TextInput extends State<TextInput> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your firstname or nickname',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                  return 'Please enter some text';
              } else if (value.length > 13) {
                  return 'Please shorten your name to 12 characters at most';
              } else {
                  globals.user = Friend(value, 350, "assets/kia sportage icon.png");
                  globals.friends = [globals.adriene, globals.clay, globals.chuxue,
                                          globals.david, globals.sanya, globals.user];
                  globals.name = value;
                  Navigator.pushReplacementNamed(context, '/home');
              }
              return null;
            },
          ),
           Center(
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}