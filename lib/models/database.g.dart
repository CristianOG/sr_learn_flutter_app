// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DecksTable extends Decks with TableInfo<$DecksTable, Deck> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<int> createdDate = GeneratedColumn<int>(
      'created_date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _newCardsPerSessionMeta =
      const VerificationMeta('newCardsPerSession');
  @override
  late final GeneratedColumn<int> newCardsPerSession = GeneratedColumn<int>(
      'new_cards_per_session', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reviewsPerSessionMeta =
      const VerificationMeta('reviewsPerSession');
  @override
  late final GeneratedColumn<int> reviewsPerSession = GeneratedColumn<int>(
      'reviews_per_session', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reviewsRemainingInSessionMeta =
      const VerificationMeta('reviewsRemainingInSession');
  @override
  late final GeneratedColumn<int> reviewsRemainingInSession =
      GeneratedColumn<int>('reviews_remaining_in_session', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(0));
  static const VerificationMeta _newCardsRemainingInSessionMeta =
      const VerificationMeta('newCardsRemainingInSession');
  @override
  late final GeneratedColumn<int> newCardsRemainingInSession =
      GeneratedColumn<int>('new_cards_remaining_in_session', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(0));
  static const VerificationMeta _lastSessionMeta =
      const VerificationMeta('lastSession');
  @override
  late final GeneratedColumn<int> lastSession = GeneratedColumn<int>(
      'last_session', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        createdDate,
        newCardsPerSession,
        reviewsPerSession,
        reviewsRemainingInSession,
        newCardsRemainingInSession,
        lastSession
      ];
  @override
  String get aliasedName => _alias ?? 'decks';
  @override
  String get actualTableName => 'decks';
  @override
  VerificationContext validateIntegrity(Insertable<Deck> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('new_cards_per_session')) {
      context.handle(
          _newCardsPerSessionMeta,
          newCardsPerSession.isAcceptableOrUnknown(
              data['new_cards_per_session']!, _newCardsPerSessionMeta));
    } else if (isInserting) {
      context.missing(_newCardsPerSessionMeta);
    }
    if (data.containsKey('reviews_per_session')) {
      context.handle(
          _reviewsPerSessionMeta,
          reviewsPerSession.isAcceptableOrUnknown(
              data['reviews_per_session']!, _reviewsPerSessionMeta));
    } else if (isInserting) {
      context.missing(_reviewsPerSessionMeta);
    }
    if (data.containsKey('reviews_remaining_in_session')) {
      context.handle(
          _reviewsRemainingInSessionMeta,
          reviewsRemainingInSession.isAcceptableOrUnknown(
              data['reviews_remaining_in_session']!,
              _reviewsRemainingInSessionMeta));
    }
    if (data.containsKey('new_cards_remaining_in_session')) {
      context.handle(
          _newCardsRemainingInSessionMeta,
          newCardsRemainingInSession.isAcceptableOrUnknown(
              data['new_cards_remaining_in_session']!,
              _newCardsRemainingInSessionMeta));
    }
    if (data.containsKey('last_session')) {
      context.handle(
          _lastSessionMeta,
          lastSession.isAcceptableOrUnknown(
              data['last_session']!, _lastSessionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Deck map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Deck(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_date'])!,
      newCardsPerSession: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}new_cards_per_session'])!,
      reviewsPerSession: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}reviews_per_session'])!,
      reviewsRemainingInSession: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}reviews_remaining_in_session'])!,
      newCardsRemainingInSession: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}new_cards_remaining_in_session'])!,
      lastSession: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_session'])!,
    );
  }

  @override
  $DecksTable createAlias(String alias) {
    return $DecksTable(attachedDatabase, alias);
  }
}

class Deck extends DataClass implements Insertable<Deck> {
  final int id;
  final String name;
  final int createdDate;
  final int newCardsPerSession;
  final int reviewsPerSession;
  final int reviewsRemainingInSession;
  final int newCardsRemainingInSession;
  final int lastSession;
  const Deck(
      {required this.id,
      required this.name,
      required this.createdDate,
      required this.newCardsPerSession,
      required this.reviewsPerSession,
      required this.reviewsRemainingInSession,
      required this.newCardsRemainingInSession,
      required this.lastSession});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_date'] = Variable<int>(createdDate);
    map['new_cards_per_session'] = Variable<int>(newCardsPerSession);
    map['reviews_per_session'] = Variable<int>(reviewsPerSession);
    map['reviews_remaining_in_session'] =
        Variable<int>(reviewsRemainingInSession);
    map['new_cards_remaining_in_session'] =
        Variable<int>(newCardsRemainingInSession);
    map['last_session'] = Variable<int>(lastSession);
    return map;
  }

  DecksCompanion toCompanion(bool nullToAbsent) {
    return DecksCompanion(
      id: Value(id),
      name: Value(name),
      createdDate: Value(createdDate),
      newCardsPerSession: Value(newCardsPerSession),
      reviewsPerSession: Value(reviewsPerSession),
      reviewsRemainingInSession: Value(reviewsRemainingInSession),
      newCardsRemainingInSession: Value(newCardsRemainingInSession),
      lastSession: Value(lastSession),
    );
  }

  factory Deck.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Deck(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdDate: serializer.fromJson<int>(json['createdDate']),
      newCardsPerSession: serializer.fromJson<int>(json['newCardsPerSession']),
      reviewsPerSession: serializer.fromJson<int>(json['reviewsPerSession']),
      reviewsRemainingInSession:
          serializer.fromJson<int>(json['reviewsRemainingInSession']),
      newCardsRemainingInSession:
          serializer.fromJson<int>(json['newCardsRemainingInSession']),
      lastSession: serializer.fromJson<int>(json['lastSession']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdDate': serializer.toJson<int>(createdDate),
      'newCardsPerSession': serializer.toJson<int>(newCardsPerSession),
      'reviewsPerSession': serializer.toJson<int>(reviewsPerSession),
      'reviewsRemainingInSession':
          serializer.toJson<int>(reviewsRemainingInSession),
      'newCardsRemainingInSession':
          serializer.toJson<int>(newCardsRemainingInSession),
      'lastSession': serializer.toJson<int>(lastSession),
    };
  }

  Deck copyWith(
          {int? id,
          String? name,
          int? createdDate,
          int? newCardsPerSession,
          int? reviewsPerSession,
          int? reviewsRemainingInSession,
          int? newCardsRemainingInSession,
          int? lastSession}) =>
      Deck(
        id: id ?? this.id,
        name: name ?? this.name,
        createdDate: createdDate ?? this.createdDate,
        newCardsPerSession: newCardsPerSession ?? this.newCardsPerSession,
        reviewsPerSession: reviewsPerSession ?? this.reviewsPerSession,
        reviewsRemainingInSession:
            reviewsRemainingInSession ?? this.reviewsRemainingInSession,
        newCardsRemainingInSession:
            newCardsRemainingInSession ?? this.newCardsRemainingInSession,
        lastSession: lastSession ?? this.lastSession,
      );
  @override
  String toString() {
    return (StringBuffer('Deck(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('newCardsPerSession: $newCardsPerSession, ')
          ..write('reviewsPerSession: $reviewsPerSession, ')
          ..write('reviewsRemainingInSession: $reviewsRemainingInSession, ')
          ..write('newCardsRemainingInSession: $newCardsRemainingInSession, ')
          ..write('lastSession: $lastSession')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      createdDate,
      newCardsPerSession,
      reviewsPerSession,
      reviewsRemainingInSession,
      newCardsRemainingInSession,
      lastSession);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Deck &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.newCardsPerSession == this.newCardsPerSession &&
          other.reviewsPerSession == this.reviewsPerSession &&
          other.reviewsRemainingInSession == this.reviewsRemainingInSession &&
          other.newCardsRemainingInSession == this.newCardsRemainingInSession &&
          other.lastSession == this.lastSession);
}

class DecksCompanion extends UpdateCompanion<Deck> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> createdDate;
  final Value<int> newCardsPerSession;
  final Value<int> reviewsPerSession;
  final Value<int> reviewsRemainingInSession;
  final Value<int> newCardsRemainingInSession;
  final Value<int> lastSession;
  const DecksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.newCardsPerSession = const Value.absent(),
    this.reviewsPerSession = const Value.absent(),
    this.reviewsRemainingInSession = const Value.absent(),
    this.newCardsRemainingInSession = const Value.absent(),
    this.lastSession = const Value.absent(),
  });
  DecksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int createdDate,
    required int newCardsPerSession,
    required int reviewsPerSession,
    this.reviewsRemainingInSession = const Value.absent(),
    this.newCardsRemainingInSession = const Value.absent(),
    this.lastSession = const Value.absent(),
  })  : name = Value(name),
        createdDate = Value(createdDate),
        newCardsPerSession = Value(newCardsPerSession),
        reviewsPerSession = Value(reviewsPerSession);
  static Insertable<Deck> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? createdDate,
    Expression<int>? newCardsPerSession,
    Expression<int>? reviewsPerSession,
    Expression<int>? reviewsRemainingInSession,
    Expression<int>? newCardsRemainingInSession,
    Expression<int>? lastSession,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdDate != null) 'created_date': createdDate,
      if (newCardsPerSession != null)
        'new_cards_per_session': newCardsPerSession,
      if (reviewsPerSession != null) 'reviews_per_session': reviewsPerSession,
      if (reviewsRemainingInSession != null)
        'reviews_remaining_in_session': reviewsRemainingInSession,
      if (newCardsRemainingInSession != null)
        'new_cards_remaining_in_session': newCardsRemainingInSession,
      if (lastSession != null) 'last_session': lastSession,
    });
  }

  DecksCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? createdDate,
      Value<int>? newCardsPerSession,
      Value<int>? reviewsPerSession,
      Value<int>? reviewsRemainingInSession,
      Value<int>? newCardsRemainingInSession,
      Value<int>? lastSession}) {
    return DecksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      newCardsPerSession: newCardsPerSession ?? this.newCardsPerSession,
      reviewsPerSession: reviewsPerSession ?? this.reviewsPerSession,
      reviewsRemainingInSession:
          reviewsRemainingInSession ?? this.reviewsRemainingInSession,
      newCardsRemainingInSession:
          newCardsRemainingInSession ?? this.newCardsRemainingInSession,
      lastSession: lastSession ?? this.lastSession,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<int>(createdDate.value);
    }
    if (newCardsPerSession.present) {
      map['new_cards_per_session'] = Variable<int>(newCardsPerSession.value);
    }
    if (reviewsPerSession.present) {
      map['reviews_per_session'] = Variable<int>(reviewsPerSession.value);
    }
    if (reviewsRemainingInSession.present) {
      map['reviews_remaining_in_session'] =
          Variable<int>(reviewsRemainingInSession.value);
    }
    if (newCardsRemainingInSession.present) {
      map['new_cards_remaining_in_session'] =
          Variable<int>(newCardsRemainingInSession.value);
    }
    if (lastSession.present) {
      map['last_session'] = Variable<int>(lastSession.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('newCardsPerSession: $newCardsPerSession, ')
          ..write('reviewsPerSession: $reviewsPerSession, ')
          ..write('reviewsRemainingInSession: $reviewsRemainingInSession, ')
          ..write('newCardsRemainingInSession: $newCardsRemainingInSession, ')
          ..write('lastSession: $lastSession')
          ..write(')'))
        .toString();
  }
}

class $CardsTable extends Cards with TableInfo<$CardsTable, Card> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _deckIdMeta = const VerificationMeta('deckId');
  @override
  late final GeneratedColumn<int> deckId = GeneratedColumn<int>(
      'deck_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES decks (id)'));
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _originalMeta =
      const VerificationMeta('original');
  @override
  late final GeneratedColumn<String> original = GeneratedColumn<String>(
      'original', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _originalOptionalMeta =
      const VerificationMeta('originalOptional');
  @override
  late final GeneratedColumn<String> originalOptional = GeneratedColumn<String>(
      'original_optional', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 300),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<int> createdDate = GeneratedColumn<int>(
      'created_date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _intervalMeta =
      const VerificationMeta('interval');
  @override
  late final GeneratedColumn<double> interval = GeneratedColumn<double>(
      'interval', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _consecutiveRememberedMeta =
      const VerificationMeta('consecutiveRemembered');
  @override
  late final GeneratedColumn<int> consecutiveRemembered = GeneratedColumn<int>(
      'consecutive_remembered', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _reviewsMeta =
      const VerificationMeta('reviews');
  @override
  late final GeneratedColumn<int> reviews = GeneratedColumn<int>(
      'reviews', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lapsesMeta = const VerificationMeta('lapses');
  @override
  late final GeneratedColumn<int> lapses = GeneratedColumn<int>(
      'lapses', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _learningStepMeta =
      const VerificationMeta('learningStep');
  @override
  late final GeneratedColumn<int> learningStep = GeneratedColumn<int>(
      'learning_step', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _easeFactorMeta =
      const VerificationMeta('easeFactor');
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
      'ease_factor', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(2.5));
  static const VerificationMeta _lastReviewedMeta =
      const VerificationMeta('lastReviewed');
  @override
  late final GeneratedColumn<int> lastReviewed = GeneratedColumn<int>(
      'last_reviewed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _phaseMeta = const VerificationMeta('phase');
  @override
  late final GeneratedColumnWithTypeConverter<Phase, int> phase =
      GeneratedColumn<int>('phase', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<Phase>($CardsTable.$converterphase);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        deckId,
        translation,
        original,
        originalOptional,
        notes,
        createdDate,
        interval,
        consecutiveRemembered,
        reviews,
        lapses,
        learningStep,
        easeFactor,
        lastReviewed,
        phase,
        score
      ];
  @override
  String get aliasedName => _alias ?? 'cards';
  @override
  String get actualTableName => 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<Card> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('deck_id')) {
      context.handle(_deckIdMeta,
          deckId.isAcceptableOrUnknown(data['deck_id']!, _deckIdMeta));
    } else if (isInserting) {
      context.missing(_deckIdMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('original')) {
      context.handle(_originalMeta,
          original.isAcceptableOrUnknown(data['original']!, _originalMeta));
    } else if (isInserting) {
      context.missing(_originalMeta);
    }
    if (data.containsKey('original_optional')) {
      context.handle(
          _originalOptionalMeta,
          originalOptional.isAcceptableOrUnknown(
              data['original_optional']!, _originalOptionalMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('interval')) {
      context.handle(_intervalMeta,
          interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta));
    }
    if (data.containsKey('consecutive_remembered')) {
      context.handle(
          _consecutiveRememberedMeta,
          consecutiveRemembered.isAcceptableOrUnknown(
              data['consecutive_remembered']!, _consecutiveRememberedMeta));
    }
    if (data.containsKey('reviews')) {
      context.handle(_reviewsMeta,
          reviews.isAcceptableOrUnknown(data['reviews']!, _reviewsMeta));
    }
    if (data.containsKey('lapses')) {
      context.handle(_lapsesMeta,
          lapses.isAcceptableOrUnknown(data['lapses']!, _lapsesMeta));
    }
    if (data.containsKey('learning_step')) {
      context.handle(
          _learningStepMeta,
          learningStep.isAcceptableOrUnknown(
              data['learning_step']!, _learningStepMeta));
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
          _easeFactorMeta,
          easeFactor.isAcceptableOrUnknown(
              data['ease_factor']!, _easeFactorMeta));
    }
    if (data.containsKey('last_reviewed')) {
      context.handle(
          _lastReviewedMeta,
          lastReviewed.isAcceptableOrUnknown(
              data['last_reviewed']!, _lastReviewedMeta));
    }
    context.handle(_phaseMeta, const VerificationResult.success());
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Card map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Card(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deckId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}deck_id'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation'])!,
      original: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original'])!,
      originalOptional: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}original_optional']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_date'])!,
      interval: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}interval'])!,
      consecutiveRemembered: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}consecutive_remembered'])!,
      reviews: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reviews'])!,
      lapses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lapses'])!,
      learningStep: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}learning_step'])!,
      easeFactor: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ease_factor'])!,
      lastReviewed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_reviewed'])!,
      phase: $CardsTable.$converterphase.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}phase'])!),
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}score'])!,
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Phase, int, int> $converterphase =
      const EnumIndexConverter<Phase>(Phase.values);
}

class Card extends DataClass implements Insertable<Card> {
  final int id;
  final int deckId;
  final String translation;
  final String original;
  final String? originalOptional;
  final String? notes;

  /// Creation date in seconds from unix epoch
  final int createdDate;
  final double interval;
  final int consecutiveRemembered;
  final int reviews;
  final int lapses;
  final int learningStep;

  /// Value between 1.3 and 2.5 that determines next interval.
  final double easeFactor;

  /// Last review date in seconds from unix epoch
  final int lastReviewed;
  final Phase phase;
  final double score;
  const Card(
      {required this.id,
      required this.deckId,
      required this.translation,
      required this.original,
      this.originalOptional,
      this.notes,
      required this.createdDate,
      required this.interval,
      required this.consecutiveRemembered,
      required this.reviews,
      required this.lapses,
      required this.learningStep,
      required this.easeFactor,
      required this.lastReviewed,
      required this.phase,
      required this.score});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['deck_id'] = Variable<int>(deckId);
    map['translation'] = Variable<String>(translation);
    map['original'] = Variable<String>(original);
    if (!nullToAbsent || originalOptional != null) {
      map['original_optional'] = Variable<String>(originalOptional);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_date'] = Variable<int>(createdDate);
    map['interval'] = Variable<double>(interval);
    map['consecutive_remembered'] = Variable<int>(consecutiveRemembered);
    map['reviews'] = Variable<int>(reviews);
    map['lapses'] = Variable<int>(lapses);
    map['learning_step'] = Variable<int>(learningStep);
    map['ease_factor'] = Variable<double>(easeFactor);
    map['last_reviewed'] = Variable<int>(lastReviewed);
    {
      final converter = $CardsTable.$converterphase;
      map['phase'] = Variable<int>(converter.toSql(phase));
    }
    map['score'] = Variable<double>(score);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      deckId: Value(deckId),
      translation: Value(translation),
      original: Value(original),
      originalOptional: originalOptional == null && nullToAbsent
          ? const Value.absent()
          : Value(originalOptional),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdDate: Value(createdDate),
      interval: Value(interval),
      consecutiveRemembered: Value(consecutiveRemembered),
      reviews: Value(reviews),
      lapses: Value(lapses),
      learningStep: Value(learningStep),
      easeFactor: Value(easeFactor),
      lastReviewed: Value(lastReviewed),
      phase: Value(phase),
      score: Value(score),
    );
  }

  factory Card.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Card(
      id: serializer.fromJson<int>(json['id']),
      deckId: serializer.fromJson<int>(json['deckId']),
      translation: serializer.fromJson<String>(json['translation']),
      original: serializer.fromJson<String>(json['original']),
      originalOptional: serializer.fromJson<String?>(json['originalOptional']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdDate: serializer.fromJson<int>(json['createdDate']),
      interval: serializer.fromJson<double>(json['interval']),
      consecutiveRemembered:
          serializer.fromJson<int>(json['consecutiveRemembered']),
      reviews: serializer.fromJson<int>(json['reviews']),
      lapses: serializer.fromJson<int>(json['lapses']),
      learningStep: serializer.fromJson<int>(json['learningStep']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      lastReviewed: serializer.fromJson<int>(json['lastReviewed']),
      phase: $CardsTable.$converterphase
          .fromJson(serializer.fromJson<int>(json['phase'])),
      score: serializer.fromJson<double>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deckId': serializer.toJson<int>(deckId),
      'translation': serializer.toJson<String>(translation),
      'original': serializer.toJson<String>(original),
      'originalOptional': serializer.toJson<String?>(originalOptional),
      'notes': serializer.toJson<String?>(notes),
      'createdDate': serializer.toJson<int>(createdDate),
      'interval': serializer.toJson<double>(interval),
      'consecutiveRemembered': serializer.toJson<int>(consecutiveRemembered),
      'reviews': serializer.toJson<int>(reviews),
      'lapses': serializer.toJson<int>(lapses),
      'learningStep': serializer.toJson<int>(learningStep),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'lastReviewed': serializer.toJson<int>(lastReviewed),
      'phase':
          serializer.toJson<int>($CardsTable.$converterphase.toJson(phase)),
      'score': serializer.toJson<double>(score),
    };
  }

  Card copyWith(
          {int? id,
          int? deckId,
          String? translation,
          String? original,
          Value<String?> originalOptional = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          int? createdDate,
          double? interval,
          int? consecutiveRemembered,
          int? reviews,
          int? lapses,
          int? learningStep,
          double? easeFactor,
          int? lastReviewed,
          Phase? phase,
          double? score}) =>
      Card(
        id: id ?? this.id,
        deckId: deckId ?? this.deckId,
        translation: translation ?? this.translation,
        original: original ?? this.original,
        originalOptional: originalOptional.present
            ? originalOptional.value
            : this.originalOptional,
        notes: notes.present ? notes.value : this.notes,
        createdDate: createdDate ?? this.createdDate,
        interval: interval ?? this.interval,
        consecutiveRemembered:
            consecutiveRemembered ?? this.consecutiveRemembered,
        reviews: reviews ?? this.reviews,
        lapses: lapses ?? this.lapses,
        learningStep: learningStep ?? this.learningStep,
        easeFactor: easeFactor ?? this.easeFactor,
        lastReviewed: lastReviewed ?? this.lastReviewed,
        phase: phase ?? this.phase,
        score: score ?? this.score,
      );
  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('translation: $translation, ')
          ..write('original: $original, ')
          ..write('originalOptional: $originalOptional, ')
          ..write('notes: $notes, ')
          ..write('createdDate: $createdDate, ')
          ..write('interval: $interval, ')
          ..write('consecutiveRemembered: $consecutiveRemembered, ')
          ..write('reviews: $reviews, ')
          ..write('lapses: $lapses, ')
          ..write('learningStep: $learningStep, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('lastReviewed: $lastReviewed, ')
          ..write('phase: $phase, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      deckId,
      translation,
      original,
      originalOptional,
      notes,
      createdDate,
      interval,
      consecutiveRemembered,
      reviews,
      lapses,
      learningStep,
      easeFactor,
      lastReviewed,
      phase,
      score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.id == this.id &&
          other.deckId == this.deckId &&
          other.translation == this.translation &&
          other.original == this.original &&
          other.originalOptional == this.originalOptional &&
          other.notes == this.notes &&
          other.createdDate == this.createdDate &&
          other.interval == this.interval &&
          other.consecutiveRemembered == this.consecutiveRemembered &&
          other.reviews == this.reviews &&
          other.lapses == this.lapses &&
          other.learningStep == this.learningStep &&
          other.easeFactor == this.easeFactor &&
          other.lastReviewed == this.lastReviewed &&
          other.phase == this.phase &&
          other.score == this.score);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<int> id;
  final Value<int> deckId;
  final Value<String> translation;
  final Value<String> original;
  final Value<String?> originalOptional;
  final Value<String?> notes;
  final Value<int> createdDate;
  final Value<double> interval;
  final Value<int> consecutiveRemembered;
  final Value<int> reviews;
  final Value<int> lapses;
  final Value<int> learningStep;
  final Value<double> easeFactor;
  final Value<int> lastReviewed;
  final Value<Phase> phase;
  final Value<double> score;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.deckId = const Value.absent(),
    this.translation = const Value.absent(),
    this.original = const Value.absent(),
    this.originalOptional = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.interval = const Value.absent(),
    this.consecutiveRemembered = const Value.absent(),
    this.reviews = const Value.absent(),
    this.lapses = const Value.absent(),
    this.learningStep = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.lastReviewed = const Value.absent(),
    this.phase = const Value.absent(),
    this.score = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    required int deckId,
    required String translation,
    required String original,
    this.originalOptional = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdDate,
    this.interval = const Value.absent(),
    this.consecutiveRemembered = const Value.absent(),
    this.reviews = const Value.absent(),
    this.lapses = const Value.absent(),
    this.learningStep = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.lastReviewed = const Value.absent(),
    this.phase = const Value.absent(),
    this.score = const Value.absent(),
  })  : deckId = Value(deckId),
        translation = Value(translation),
        original = Value(original),
        createdDate = Value(createdDate);
  static Insertable<Card> custom({
    Expression<int>? id,
    Expression<int>? deckId,
    Expression<String>? translation,
    Expression<String>? original,
    Expression<String>? originalOptional,
    Expression<String>? notes,
    Expression<int>? createdDate,
    Expression<double>? interval,
    Expression<int>? consecutiveRemembered,
    Expression<int>? reviews,
    Expression<int>? lapses,
    Expression<int>? learningStep,
    Expression<double>? easeFactor,
    Expression<int>? lastReviewed,
    Expression<int>? phase,
    Expression<double>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deckId != null) 'deck_id': deckId,
      if (translation != null) 'translation': translation,
      if (original != null) 'original': original,
      if (originalOptional != null) 'original_optional': originalOptional,
      if (notes != null) 'notes': notes,
      if (createdDate != null) 'created_date': createdDate,
      if (interval != null) 'interval': interval,
      if (consecutiveRemembered != null)
        'consecutive_remembered': consecutiveRemembered,
      if (reviews != null) 'reviews': reviews,
      if (lapses != null) 'lapses': lapses,
      if (learningStep != null) 'learning_step': learningStep,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (lastReviewed != null) 'last_reviewed': lastReviewed,
      if (phase != null) 'phase': phase,
      if (score != null) 'score': score,
    });
  }

  CardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? deckId,
      Value<String>? translation,
      Value<String>? original,
      Value<String?>? originalOptional,
      Value<String?>? notes,
      Value<int>? createdDate,
      Value<double>? interval,
      Value<int>? consecutiveRemembered,
      Value<int>? reviews,
      Value<int>? lapses,
      Value<int>? learningStep,
      Value<double>? easeFactor,
      Value<int>? lastReviewed,
      Value<Phase>? phase,
      Value<double>? score}) {
    return CardsCompanion(
      id: id ?? this.id,
      deckId: deckId ?? this.deckId,
      translation: translation ?? this.translation,
      original: original ?? this.original,
      originalOptional: originalOptional ?? this.originalOptional,
      notes: notes ?? this.notes,
      createdDate: createdDate ?? this.createdDate,
      interval: interval ?? this.interval,
      consecutiveRemembered:
          consecutiveRemembered ?? this.consecutiveRemembered,
      reviews: reviews ?? this.reviews,
      lapses: lapses ?? this.lapses,
      learningStep: learningStep ?? this.learningStep,
      easeFactor: easeFactor ?? this.easeFactor,
      lastReviewed: lastReviewed ?? this.lastReviewed,
      phase: phase ?? this.phase,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deckId.present) {
      map['deck_id'] = Variable<int>(deckId.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (original.present) {
      map['original'] = Variable<String>(original.value);
    }
    if (originalOptional.present) {
      map['original_optional'] = Variable<String>(originalOptional.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<int>(createdDate.value);
    }
    if (interval.present) {
      map['interval'] = Variable<double>(interval.value);
    }
    if (consecutiveRemembered.present) {
      map['consecutive_remembered'] =
          Variable<int>(consecutiveRemembered.value);
    }
    if (reviews.present) {
      map['reviews'] = Variable<int>(reviews.value);
    }
    if (lapses.present) {
      map['lapses'] = Variable<int>(lapses.value);
    }
    if (learningStep.present) {
      map['learning_step'] = Variable<int>(learningStep.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (lastReviewed.present) {
      map['last_reviewed'] = Variable<int>(lastReviewed.value);
    }
    if (phase.present) {
      final converter = $CardsTable.$converterphase;
      map['phase'] = Variable<int>(converter.toSql(phase.value));
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('deckId: $deckId, ')
          ..write('translation: $translation, ')
          ..write('original: $original, ')
          ..write('originalOptional: $originalOptional, ')
          ..write('notes: $notes, ')
          ..write('createdDate: $createdDate, ')
          ..write('interval: $interval, ')
          ..write('consecutiveRemembered: $consecutiveRemembered, ')
          ..write('reviews: $reviews, ')
          ..write('lapses: $lapses, ')
          ..write('learningStep: $learningStep, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('lastReviewed: $lastReviewed, ')
          ..write('phase: $phase, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $DecksTable decks = $DecksTable(this);
  late final $CardsTable cards = $CardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [decks, cards];
}
