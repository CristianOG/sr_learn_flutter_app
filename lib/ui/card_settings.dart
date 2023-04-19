import 'package:flutter/material.dart';
import 'package:learn_app/src/settings.dart';

import '../models/database.dart' as db;
import '../src/database_helper.dart';

class CardSettingsView extends StatefulWidget {
  const CardSettingsView({super.key, required this.cardId});

  final int cardId;

  @override
  CardSettingsViewState createState() {
    return CardSettingsViewState();
  }
}

class CardSettingsViewState extends State<CardSettingsView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Card Details',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      body: Form(
        key: _formKey,
        child: FutureBuilder<db.Card>(
          future: DatabaseHelper.database.getCard(widget.cardId),
          builder: (BuildContext context, AsyncSnapshot<db.Card> snapshot) {

            List<Widget> children;
            if (snapshot.hasData) {
              var card = snapshot.data!;
              children = <Widget>[
                Text('translation: ${card.translation}'),
                Text('original: ${card.original}'),
                Text('originalOptional: ${card.originalOptional}'),
                Text('notes: ${card.notes}'),
                Text('createdDate: ${db.MyDatabase.dateTimeFromEpoch(card.createdDate)}'),
                const SizedBox(height: 10,),
                Text('consecutiveRemembered: ${card.consecutiveRemembered}'),
                Text('lapses: ${card.lapses}'),
                Text('reviews: ${card.reviews}'),
                const SizedBox(height: 10,),
                Text('interval: ${card.interval}'),
                Text('due: ${db.MyDatabase.intervaledDateTime(card.interval, card.lastReviewed)}'),
                Text('easeFactor: ${card.easeFactor}'),
                Text('learningStep: ${card.learningStep}'),
                Text('phase: ${card.phase}'),
                Text('lastReviewed: ${db.MyDatabase.dateTimeFromEpoch(card.lastReviewed)}'),
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