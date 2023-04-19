import 'package:drift/drift.dart';

class Decks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  /// Creation date in milliseconds from unix epoch
  IntColumn get createdDate => integer()();

  IntColumn get newCardsPerSession => integer()();
  IntColumn get reviewsPerSession => integer()();


  IntColumn get reviewsRemainingInSession => integer().withDefault(const Constant(0))();
  IntColumn get newCardsRemainingInSession => integer().withDefault(const Constant(0))();
  /// Last session date in milliseconds from unix epoch
  IntColumn get lastSession => integer().withDefault(const Constant(0))();
}