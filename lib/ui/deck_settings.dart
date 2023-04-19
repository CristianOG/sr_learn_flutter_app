import 'package:flutter/material.dart';
import 'package:learn_app/src/settings.dart';

import '../models/database.dart';
import '../src/database_helper.dart';

class DeckSettingsView extends StatefulWidget {
  const DeckSettingsView({super.key, required this.deckId});

  final int deckId;

  @override
  DeckSettingsViewState createState() {
    return DeckSettingsViewState();
  }
}

class DeckSettingsViewState extends State<DeckSettingsView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Deck Details',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      body: Form(
        key: _formKey,
        child: FutureBuilder<Deck>(
          future: DatabaseHelper.database.getDeck(widget.deckId),
          builder: (BuildContext context, AsyncSnapshot<Deck> snapshot) {

            List<Widget> children;
            if (snapshot.hasData) {
              var deck = snapshot.data!;
              children = <Widget>[
                Text('New per session: ${deck.newCardsPerSession}'),
                Text('New remaining: ${deck.newCardsRemainingInSession}'),
                Text('Reviews per session: ${deck.reviewsPerSession}'),
                Text('Reviews remaining: ${deck.reviewsRemainingInSession}'),
                Text('Last session: ${MyDatabase.dateTimeFromEpoch(deck.lastSession)}'),
                Text('Created: ${MyDatabase.dateTimeFromEpoch(deck.createdDate)}'),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );

            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            //   child: const Text('Cancel'),
            // ),
          }
        )
      ),
    );
  }
}