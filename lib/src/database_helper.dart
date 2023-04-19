import '../models/database.dart';

class DatabaseHelper {

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static MyDatabase? _database;
  static MyDatabase get database {
    if (_database != null) return _database!;
    _database = _initDatabase();
    return _database!;
  }

  // open the database
  static _initDatabase() {

    return MyDatabase();

    //await deleteDatabase(join(await getDatabasesPath(), _databaseName));

    // return await openDatabase(join(await getDatabasesPath(), _databaseName),
    //   version: _databaseVersion,
    //   onUpgrade: (db, oldVersion, newVersion) {
    //     Log.info('oldVersion: $oldVersion, newVersion: $newVersion');
    //   },
    //   onCreate: _onCreate
    // );
  }

  // SQL code to create the database table
  // Future<void> _onCreate(Database db, int version) async {
  //   Log.info('create db');
  //   await db.execute('CREATE TABLE decks(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, createdDate INTEGER)');
  //   await db.execute('CREATE TABLE cards(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, deckId INTEGER, translation TEXT, original TEXT, originalOptional TEXT, notes TEXT, createdDate INTEGER)');
  // }

  // Helper methods

  // Inserts a row in the database
  // Future<int> insert(Map<String, dynamic> row, String table) async {
  //   Database db = await instance.database;
  //   return await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // // Deletes a row from the database
  // Future<int> delete(String table, String columnId, int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  // }

  // // Updates a row in the database
  // Future<int> update(Map<String, dynamic> row, String table, String columnId) async {
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // // Gets all rows in the database
  // Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
  //   Database db = await instance.database;
  //   return await db.query(table);
  // }

  // Future<List<Map<String, dynamic>>> queryByKey(String table, String columnId, dynamic id) async {
  //   Database db = await instance.database;
  //   return await db.query(table, where: '$columnId = ?', whereArgs: [id]);
  // }
}