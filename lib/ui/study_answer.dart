import 'package:flutter/material.dart';
import 'package:learn_app/models/card.dart';
import 'package:learn_app/src/database_helper.dart';
import 'package:learn_app/src/log.dart';
import 'package:learn_app/src/settings.dart';


import '../models/database.dart' as db;
import 'study_question.dart';

class StudyAnswerView extends StatefulWidget {
  const StudyAnswerView({super.key, required this.card, required this.deck});

  final db.Card card;
  final db.Deck deck;

  @override
  State<StudyAnswerView> createState() => _StudyAnswerViewState();

}

enum Result {
   again,
   hard,
   good,
   easy
}

class _StudyAnswerViewState extends State<StudyAnswerView> {


  @override
  void initState() {
    super.initState();
    
  }

  void setEase(Result result) {

    // update stats: lastReviewed, consecutiveRemembered
    // interval, easeFactor, lateness, phase, score, fuzz

    // new card: after first answer, becomes learning
    // learning: has x predifined steps until moved to review
    // review: keep increasing or decreasing interval

    //  - again => resets
    //  - hard => repeat or show more frequently
    //  - good => next step
    //  - easy => next phase (review) or interval boost

    db.Card card = widget.card;
    double easeFactor = card.easeFactor;
    double interval = card.interval;
    Phase phase = card.phase;
    int learningStep = 0;
    int lapses = card.lapses;
    int reviews = card.reviews;
    int consecutiveRemembered = card.consecutiveRemembered;

    if (result != Result.again && card.phase == Phase.review) {
      consecutiveRemembered++;
    }

    bool relearning = card.phase == Phase.relearning;
    if (card.phase == Phase.none) {
      DatabaseHelper.database.decreaseNewCards(card.deckId);
    }

    if (card.phase == Phase.none || card.phase == Phase.learning || card.phase == Phase.relearning) {
      
      if (!relearning) {
        easeFactor = 2.5;
        phase = Phase.learning;
      }

      switch(result) {

        case Result.again:
          interval = Settings.LEARNING_STEPS[0];
          learningStep = 0;
          break;

        case Result.hard:
          interval = Settings.LEARNING_STEPS[learningStep + 1] / 2;
          break;

        case Result.good:
          learningStep++;
          if (learningStep == Settings.LEARNING_STEPS.length) {
            phase = Phase.review;
            interval = Settings.NEW_GOOD_INTERVAL;
          }
          else {
            interval = Settings.LEARNING_STEPS[learningStep];
          }
          break;

        case Result.easy:
          interval = Settings.NEW_EASY_INTERVAL;
          phase = Phase.review;
          learningStep = Settings.LEARNING_STEPS.length - 1;
          break;
      }
    }
    else if (card.phase == Phase.review) {

      // fuzz = random
      reviews++;
      double lateness = db.MyDatabase.epochToDay(DateTime.now().toUtc().millisecondsSinceEpoch) - db.MyDatabase.intervaledDateTimeEpoch(interval, card.lastReviewed);

      switch(result) {
        case Result.again:
          lapses++;
          phase = Phase.relearning;
          learningStep = 0;
          easeFactor -= 0.2;
          interval = Settings.LEARNING_STEPS[0];
          break;

        case Result.hard:
          interval = interval * Settings.HARD_INTERVAL;
          easeFactor -= 0.15;
          break;

        case Result.good:
          interval = interval * easeFactor;
          break;

        case Result.easy:
          interval = interval * easeFactor * Settings.REVIEW_EASY_INTERVAL_BOOST;
          easeFactor += 0.15;
          break;
      }

      if (result != Result.again) {
        DatabaseHelper.database.decreaseReviews(card.deckId);
      }

      // apply fuzz and lateness
    }

    Log.debug('interval: $interval, '
      'consecutiveRemembered: $consecutiveRemembered, '
      'reviews: $reviews, '
      'lapses: $lapses, '
      'learningStep: $learningStep, '
      'easeFactor: $easeFactor, '
      'lastReviewed: ${DateTime.now().toUtc().millisecondsSinceEpoch}, '
      'phase: $phase');

    // update card record
    DatabaseHelper.database.updateCard(
      card.copyWith(
        interval: interval,
        consecutiveRemembered: consecutiveRemembered,
        reviews: reviews,
        lapses: lapses,
        learningStep: learningStep,
        easeFactor: easeFactor,
        lastReviewed: DateTime.now().toUtc().millisecondsSinceEpoch,
        phase: phase,
      )
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => StudyQuestionView(deck: widget.deck),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Forced Learning :D',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      body: Center(
        child: Column(
          children: [
            
            Expanded(child: Text(widget.card.translation)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setEase(Result.again),
                  child: const Text('AGAIN'),
                ),
                ElevatedButton(
                  onPressed: () => setEase(Result.hard),
                  child: const Text('HARD'),
                ),
                ElevatedButton(
                  onPressed: () => setEase(Result.good),
                  child: const Text('GOOD'),
                ),
                ElevatedButton(
                  onPressed: () => setEase(Result.easy),
                  child: const Text('EASY'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}