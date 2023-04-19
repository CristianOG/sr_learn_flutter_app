import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'card.dart';
import 'deck.dart';

part 'database.g.dart';

//flutter pub run build_runner build

@DriftDatabase(tables: [Cards, Decks])
class MyDatabase extends _$MyDatabase {

  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Stream<List<Deck>> get watchDecks => select(decks).watch();

  Future<Deck> getDeck(int deckId) {
    return (select(decks)..where((deck) => deck.id.equals(deckId))).getSingle();
  }

  Future updateDeck(Deck entry) {
    return update(decks).replace(entry);
  }

  Future updateCard(Card entry) {
    return update(cards).replace(entry);
  }

  Future updateSessionDate(Deck target) {
    return (update(decks)
        ..where((t) => t.id.equals(target.id))
      ).write(DecksCompanion(
        lastSession: Value(DateTime.now().toUtc().millisecondsSinceEpoch),
      ),
    );
  }

  Future decreaseReviews(int deckId) {
      return customStatement(
      "UPDATE decks SET reviewsRemainingInSession = reviewsRemainingInSession - 1 WHERE deckId = ?",
      [deckId],
    );

    // return (update(decks)
    //     ..where((t) => t.id.equals(target.id))
    //   ).write(DecksCompanion(
    //     reviewsRemainingInSession: Value(target.reviewsRemainingInSession - 1),
    //   ),
    // );
  }

  Future decreaseNewCards(int deckId) {
    return customStatement(
      "UPDATE decks SET newCardsRemainingInSession = newCardsRemainingInSession - 1 WHERE deckId = ?",
      [deckId],
    );
    // return (update(decks)
    //     ..where((t) => t.id.equals(deckId))
    //   ).write(DecksCompanion(
    //     newCardsRemainingInSession: Value(target.newCardsRemainingInSession - 1),
    //   ),
    // );
  }


  Future<Card?> getNextLearningSessionCard(int deckId) {
    return (select(cards)
      ..orderBy([(t) => OrderingTerm(expression: t.interval)])
      ..where((card) => card.deckId.equals(deckId) & card.phase.equals(Phase.learning.index))
    ).getSingleOrNull();
  }

  Future<Card?> getNextReviewSessionCard(int deckId) {
    return (select(cards)
      ..orderBy([(t) => OrderingTerm(expression: t.interval)])
      ..where((card) => card.deckId.equals(deckId) & card.phase.equals(Phase.review.index))
    ).getSingleOrNull();
  }

  Future<Card?> getNextNewSessionCard(int deckId) {
    return (select(cards)
      ..orderBy([(t) => OrderingTerm(expression: t.createdDate)])
      ..where((card) => card.deckId.equals(deckId) & card.phase.equals(Phase.none.index))
    ).getSingleOrNull();
  }

  Future<List<Card>> getDeckCards(int deckId) {
    return (select(cards)..where((card) => card.deckId.equals(deckId))).get();
  }

  Stream<List<Card>> watchDeckCards(int deckId) {
    return (select(cards)..where((card) => card.deckId.equals(deckId))).watch();
  }

  Future<Card> getCard(int cardId) {
    return (select(cards)..where((card) => card.id.equals(cardId))).getSingle();
  }

  // Future<void> insertMultipleEntries() async{
  //   await batch((batch) {
  //     // functions in a batch don't have to be awaited - just
  //     // await the whole batch afterwards.
  //     batch.insertAll(schedules, [
  //       SchedulesCompanion.insert(
  //         programId: 0,
  //         cardId: 1,

     
  //       ),
  //       SchedulesCompanion.insert(
  //         programId: 0,
  //         cardId: 1,
  //       ),
  //     ]);
  //   });
  // }

  Future<int> addCard(int deckId, String translation, String original, String originalOptional, String? notes) {
    return into(cards).insert(
      CardsCompanion(
        deckId: Value(deckId),
        translation: Value(translation),
        original: Value(original),
        originalOptional: Value(originalOptional),
        notes: Value(notes),
        createdDate: Value(DateTime.now().toUtc().millisecondsSinceEpoch)
      )
    );
  }

  Future<int> addDeck(String name, Future<int> newCardsPerSession, Future<int> reviewsPerSession) async {
    return into(decks).insert(
      DecksCompanion(
        name: Value(name),
        newCardsPerSession: Value(await newCardsPerSession),
        reviewsPerSession: Value(await reviewsPerSession),
        createdDate: Value(DateTime.now().toUtc().millisecondsSinceEpoch)
      )
    );
  }

  static DateTime dateTimeFromEpoch(int dateTime) {
    return DateTime.fromMillisecondsSinceEpoch(dateTime, isUtc: true);
  }

  static DateTime intervaledDateTime(double interval, int dateTime) {
    int finalDateTime = dateTime + (interval * 24 * 60 * 60 * 1000).floor();
    return DateTime.fromMillisecondsSinceEpoch(finalDateTime, isUtc: true);
  }

  static int intervaledDateTimeEpoch(double interval, int dateTime) {
    return dateTime + (interval * 24 * 60 * 60 * 1000).floor();
  }

  static double epochToDay(int miliseconds) {
    return miliseconds * 0.001 / 60 / 60 / 24;
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'study.sqlite'));
    //file.delete();
    return NativeDatabase.createInBackground(file);
  });
}