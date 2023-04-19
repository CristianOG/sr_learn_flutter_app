// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static String get NEW_CARDS_PER_SESSION => 'NEW_CARDS_PER_SESSION';
  static int get NEW_CARDS_PER_SESSION_DEFAULT => 10;
  
  static String get NEW_DAY_STARTS => 'NEW_DAY_STARTS';

  static String get REVIEWS_PER_SESSION => 'REVIEWS_PER_DAY';
  static int get REVIEWS_PER_SESSION_DEFAUlT => 300;

  static List<double> get LEARNING_STEPS => [0.0007, 0.007];

  static double get NEW_GOOD_INTERVAL => 1.0;
  static double get NEW_EASY_INTERVAL => 4;

  static double get REVIEW_EASY_INTERVAL_BOOST => 1.3;
  static double get HARD_INTERVAL => 1.2;

  static Future<int> getNewCardsPerSession() async {
    final SharedPreferences prefs = await Settings.prefs;
    return prefs.getInt(NEW_CARDS_PER_SESSION) ?? NEW_CARDS_PER_SESSION_DEFAULT;
  }

  static Future<int> getReviewsPerSession() async {
    final SharedPreferences prefs = await Settings.prefs;
    return prefs.getInt(REVIEWS_PER_SESSION) ?? REVIEWS_PER_SESSION_DEFAUlT;
  }
}