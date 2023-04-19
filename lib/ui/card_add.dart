import 'package:flutter/material.dart';

import '../src/database_helper.dart';

class CardAddView extends StatefulWidget {
  const CardAddView({super.key, required this.deckId});

  final int deckId;

  @override
  CardAddViewState createState() {
    return CardAddViewState();
  }
}

class CardAddViewState extends State<CardAddView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    TextEditingController translationController = TextEditingController();
    TextEditingController originalController = TextEditingController();
    TextEditingController originalOptionalController = TextEditingController();
    TextEditingController notesController = TextEditingController();

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
              controller: translationController,
              decoration: const InputDecoration(
                hintText: 'Answer text',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: originalController,
              decoration: const InputDecoration(
                hintText: 'Question text',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: originalOptionalController,
              decoration: const InputDecoration(
                hintText: 'Optional question text',
              ),
            ),
            TextFormField(
              controller: notesController,
              decoration: const InputDecoration(
                hintText: 'Notes',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      DatabaseHelper.database.addCard(widget.deckId, translationController.text, originalController.text, originalOptionalController.text, notesController.text);
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