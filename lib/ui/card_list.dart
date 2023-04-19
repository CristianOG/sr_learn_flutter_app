import 'package:flutter/material.dart';
import 'package:learn_app/models/database.dart';

import '../models/database.dart' as db;
import '../src/database_helper.dart';
import 'card_add.dart';
import 'card_settings.dart';

class CardListView extends StatefulWidget {
  const CardListView({super.key, required this.deck});

  final Deck deck;

  @override
  State<CardListView> createState() => _CardListViewState();

}

class _CardListViewState extends State<CardListView> {

  late Stream<List<db.Card>> _cards;
  
@override
  void initState() {
    super.initState();
    _cards = DatabaseHelper.database.watchDeckCards(widget.deck.id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.deck.name} Deck'),
        backgroundColor: const Color(0xff764abc),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<db.Card>>(
                stream: _cards,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Text('No card data.');
                    } else {
                      List<db.Card> data = snapshot.data!;
                      return  ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          db.Card item = data[index];
                          return ListTile(
                            title: Text('${item.original} - ${item.translation}'),
                            onTap: () {
                              // edit
                            },
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                OutlinedButton(
                                  onPressed: () {
                                    
                                  },
                                  child: const Icon(Icons.delete_forever),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return CardSettingsView(cardId: item.id);
                                        }
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.settings),
                                ),
                              ],
                            )
                          );
                        },
                      );
                    }
                  }
                  else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CardAddView(deckId: widget.deck.id),
                  ),
                );
              },
              child: const Text('ADD CARD'),
            ),
          ],
        ),
      ),
    );
  }
}