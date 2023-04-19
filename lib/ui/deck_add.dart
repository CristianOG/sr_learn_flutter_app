import 'package:flutter/material.dart';
import 'package:learn_app/src/settings.dart';

import '../src/database_helper.dart';

class DeckAddView extends StatefulWidget {
  const DeckAddView({super.key});

  @override
  DeckAddViewState createState() {
    return DeckAddViewState();
  }
}

class DeckAddViewState extends State<DeckAddView> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<DeckAddState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    TextEditingController nameController = TextEditingController();

    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Forced Learning :D',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Deck name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DatabaseHelper.database.addDeck(nameController.text, Settings.getNewCardsPerSession(), Settings.getReviewsPerSession());
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}