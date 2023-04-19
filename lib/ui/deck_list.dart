import 'package:flutter/material.dart';
import 'package:learn_app/ui/card_list.dart';
import 'package:learn_app/ui/deck_add.dart';
import 'package:learn_app/ui/deck_settings.dart';
import 'package:learn_app/ui/study_question.dart';

import '../models/database.dart';
import '../src/database_helper.dart';

class DeckListView extends StatefulWidget {
  const DeckListView({Key? key}):super(key:key);

  @override
  State<DeckListView> createState() => _DeckListViewState();
}

class _DeckListViewState extends State<DeckListView> {

  late Stream<List<Deck>> _decks;
  
  @override
  void initState() {
    super.initState();
    _decks = DatabaseHelper.database.watchDecks;
  // _decks.listen((event) {

  // });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Deck>>(
              stream: _decks,
               builder: (context, snapshot) {
              
                  if (snapshot.hasData) {
                    List<Deck> data = snapshot.data!;
                    if (data.isEmpty) {
                      return const Text('No deck data.');
                    } else {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          Deck item = data[index];
                          return ListTile(
                            title: Text(item.name),
                            subtitle: Text('ID: ${item.id}'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CardListView(deck: item);
                                  }
                                ),
                              );
                            },
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return StudyQuestionView(deck: item);
                                        }
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.book),
                                ),
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
                                          return DeckSettingsView(deckId: item.id);
                                        }
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.settings),
                                ),
                              ]
                            )
                          );
                        },
                      );
                    }
                  }
                  else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
               },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const DeckAddView(),
                  ),
                );
              },
              child: const Text('ADD DECK'),
            ),
          ],
      ),
    );
  }
}