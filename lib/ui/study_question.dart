import 'package:flutter/material.dart';
import 'package:learn_app/src/log.dart';
import 'package:learn_app/ui/study_answer.dart';

import '../models/database.dart' as db;
import '../src/database_helper.dart';
import '../src/settings.dart';

class StudyQuestionView extends StatefulWidget {
  const StudyQuestionView({super.key, required this.deck});

  final db.Deck deck;
  
  @override
  State<StudyQuestionView> createState() => _StudyQuestionViewState();

}

class _StudyQuestionViewState extends State<StudyQuestionView> {

  db.Card? selectedCard;

  bool checkIntervalIsComplete(double interval, int last) {
    
    if (last == 0 || interval <= 0) {
      return false;
    }

    int now = DateTime.now().toUtc().millisecondsSinceEpoch;
    int reviewDate = db.MyDatabase.intervaledDateTimeEpoch(interval, last);
    if (now < reviewDate) {
      return false;
    }

    return true; // interval is complete
  }

  Future<db.Card?> prepareCard() async {

    db.Deck deck = widget.deck;
    int newCardsLeft = deck.newCardsRemainingInSession;
    int reviewsLeft = deck.reviewsRemainingInSession;

    if (db.MyDatabase.epochToDay(deck.lastSession) != db.MyDatabase.epochToDay(DateTime.now().toUtc().millisecondsSinceEpoch)) {

      newCardsLeft = await Settings.getNewCardsPerSession();
      reviewsLeft = await Settings.getReviewsPerSession();

      await DatabaseHelper.database.updateSessionDate(deck);
      await DatabaseHelper.database.updateDeck(deck.copyWith(
        newCardsRemainingInSession: deck.newCardsPerSession,
        reviewsRemainingInSession: deck.reviewsPerSession 
      ));
    }

    db.Card? nextLearningCard = await DatabaseHelper.database.getNextLearningSessionCard(deck.id);
    db.Card? nextNewCard = await DatabaseHelper.database.getNextNewSessionCard(deck.id);
    db.Card? nextReviewCard = await DatabaseHelper.database.getNextReviewSessionCard(deck.id);

    // if(nextLearningCard != null){
    //   Log.debug('interval: ${nextLearningCard.interval}, lastReviewed: ${nextLearningCard.lastReviewed}, '
    //           'intervaledDateTimeEpoch ${db.MyDatabase.intervaledDateTimeEpoch(nextLearningCard.interval, nextLearningCard.lastReviewed)}'
    //           'now: ${DateTime.now().toUtc().millisecondsSinceEpoch}'
    //           '');
    // }

    // check learning card interval is complete, this card should take priority over anything
    if (nextLearningCard != null && checkIntervalIsComplete(nextLearningCard.interval, nextLearningCard.lastReviewed)) {
      //Log.debug('learning card: ${nextLearningCard.translation}');
      selectedCard = nextLearningCard;
    }
    else{
      // to decide between new card and review, calculate how many reviews per new card should be shown reviews / news
      int reviewsPerNewCard = (deck.reviewsPerSession / deck.newCardsPerSession).round();
      int studiedNewCards = deck.newCardsPerSession - newCardsLeft;
      if (reviewsLeft > 0 && nextReviewCard != null && checkIntervalIsComplete(nextReviewCard.interval, nextReviewCard.lastReviewed) && 
          (nextNewCard == null ||
           newCardsLeft == 0 ||
           reviewsLeft > deck.reviewsPerSession - studiedNewCards * reviewsPerNewCard)) {

        //Log.debug('review card: ${nextReviewCard.translation}');
        // review card
        selectedCard = nextReviewCard;
      }
      else if (newCardsLeft > 0 && nextNewCard != null) {
        //Log.debug('new card: ${nextNewCard.translation}');
        // new card
        selectedCard = nextNewCard;
      }
      else {

        //Log.debug('none');
        // session finished
        selectedCard = null;
      }
    }

    return selectedCard;
  }

  @override
  Widget build(BuildContext context) {

    prepareCard();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Studying ${widget.deck.name}'),
        backgroundColor: const Color(0xff764abc),
      ),
      body: Center(
        child: FutureBuilder<db.Card?>(
          future: prepareCard(),
          builder: (context, snapshot) {

            List<Widget> children;
            if (snapshot.hasData) {

              var card = snapshot.data!;
              children = <Widget>[
                Expanded(
                  child: Text (card.original)
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => StudyAnswerView(card: selectedCard!, deck: widget.deck),
                      ),
                    );
                  },
                  child: const Text('SHOW ANSWER'),
                ),
              ];

            } else if (snapshot.hasError) {

              children = <Widget>[
                Text('Error: ${snapshot.error}'),
              ];

            } else {

              children = <Widget>[
                const Text('Nothing to study')
              ];

            }

            return Column(children: children,);
          },  
        ),
      ),
    );
  }
}