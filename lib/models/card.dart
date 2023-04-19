import 'package:drift/drift.dart';

import 'deck.dart';

enum Phase {
   none,
   learning,
   review,
   relearning
}

class Cards extends Table {
  
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deckId => integer().references(Decks, #id)();
  TextColumn get translation => text().withLength(min: 0, max: 100)();
  TextColumn get original => text().withLength(min: 0, max: 100)();
  TextColumn get originalOptional => text().withLength(min: 0, max: 100).nullable()();
  TextColumn get notes => text().withLength(min: 0, max: 300).nullable()();
  /// Creation date in milliseconds from unix epoch
  IntColumn get createdDate => integer()();

  RealColumn get interval => real().withDefault(const Constant(0))();
  IntColumn get consecutiveRemembered => integer().withDefault(const Constant(0))();
  IntColumn get reviews => integer().withDefault(const Constant(0))();
  IntColumn get lapses => integer().withDefault(const Constant(0))();

  IntColumn get learningStep => integer().withDefault(const Constant(0))();
  /// Value between 1.3 and 2.5 that determines next interval.
  RealColumn get easeFactor => real().withDefault(const Constant(2.5))();
  /// Last review date in milliseconds from unix epoch
  IntColumn get lastReviewed => integer().withDefault(const Constant(0))();
  IntColumn get phase => intEnum<Phase>().withDefault(const Constant(0))();
  RealColumn get score => real().withDefault(const Constant(0))();
}