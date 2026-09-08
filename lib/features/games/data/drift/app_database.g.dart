// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $GameSessionsTable extends GameSessions
    with TableInfo<$GameSessionsTable, GameSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _gameTypeMeta =
      const VerificationMeta('gameType');
  @override
  late final GeneratedColumn<String> gameType = GeneratedColumn<String>(
      'game_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
      'difficulty', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('unsynced'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, gameType, difficulty, startTime, endTime, status, syncStatus];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<GameSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('game_type')) {
      context.handle(_gameTypeMeta,
          gameType.isAcceptableOrUnknown(data['game_type']!, _gameTypeMeta));
    } else if (isInserting) {
      context.missing(_gameTypeMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameSession(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      gameType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}game_type'])!,
      difficulty: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}difficulty'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $GameSessionsTable createAlias(String alias) {
    return $GameSessionsTable(attachedDatabase, alias);
  }
}

class GameSession extends DataClass implements Insertable<GameSession> {
  /// Primary key — client-generated UUID v4 (offline-first; no server needed).
  final String id;

  /// Which game produced this session.
  /// Values: 'memory_matching' | 'pattern_recognition'
  final String gameType;

  /// Selected difficulty level.
  /// Values: 'easy' | 'medium' | 'hard'
  final String difficulty;

  /// UTC epoch milliseconds when the session started.
  final int startTime;

  /// UTC epoch milliseconds when the session ended.
  /// Null while session is still in progress.
  final int? endTime;

  /// Session lifecycle state.
  /// Values: 'in_progress' | 'completed' | 'abandoned'
  final String status;

  /// Sync lifecycle state for offline-first architecture.
  /// Values: 'unsynced' | 'synced' | 'sync_failed'
  final String syncStatus;
  const GameSession(
      {required this.id,
      required this.gameType,
      required this.difficulty,
      required this.startTime,
      this.endTime,
      required this.status,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['game_type'] = Variable<String>(gameType);
    map['difficulty'] = Variable<String>(difficulty);
    map['start_time'] = Variable<int>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<int>(endTime);
    }
    map['status'] = Variable<String>(status);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  GameSessionsCompanion toCompanion(bool nullToAbsent) {
    return GameSessionsCompanion(
      id: Value(id),
      gameType: Value(gameType),
      difficulty: Value(difficulty),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      status: Value(status),
      syncStatus: Value(syncStatus),
    );
  }

  factory GameSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameSession(
      id: serializer.fromJson<String>(json['id']),
      gameType: serializer.fromJson<String>(json['gameType']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int?>(json['endTime']),
      status: serializer.fromJson<String>(json['status']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'gameType': serializer.toJson<String>(gameType),
      'difficulty': serializer.toJson<String>(difficulty),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int?>(endTime),
      'status': serializer.toJson<String>(status),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  GameSession copyWith(
          {String? id,
          String? gameType,
          String? difficulty,
          int? startTime,
          Value<int?> endTime = const Value.absent(),
          String? status,
          String? syncStatus}) =>
      GameSession(
        id: id ?? this.id,
        gameType: gameType ?? this.gameType,
        difficulty: difficulty ?? this.difficulty,
        startTime: startTime ?? this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        status: status ?? this.status,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  GameSession copyWithCompanion(GameSessionsCompanion data) {
    return GameSession(
      id: data.id.present ? data.id.value : this.id,
      gameType: data.gameType.present ? data.gameType.value : this.gameType,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      status: data.status.present ? data.status.value : this.status,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameSession(')
          ..write('id: $id, ')
          ..write('gameType: $gameType, ')
          ..write('difficulty: $difficulty, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, gameType, difficulty, startTime, endTime, status, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameSession &&
          other.id == this.id &&
          other.gameType == this.gameType &&
          other.difficulty == this.difficulty &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.status == this.status &&
          other.syncStatus == this.syncStatus);
}

class GameSessionsCompanion extends UpdateCompanion<GameSession> {
  final Value<String> id;
  final Value<String> gameType;
  final Value<String> difficulty;
  final Value<int> startTime;
  final Value<int?> endTime;
  final Value<String> status;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const GameSessionsCompanion({
    this.id = const Value.absent(),
    this.gameType = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GameSessionsCompanion.insert({
    required String id,
    required String gameType,
    required String difficulty,
    required int startTime,
    this.endTime = const Value.absent(),
    required String status,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        gameType = Value(gameType),
        difficulty = Value(difficulty),
        startTime = Value(startTime),
        status = Value(status);
  static Insertable<GameSession> custom({
    Expression<String>? id,
    Expression<String>? gameType,
    Expression<String>? difficulty,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<String>? status,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameType != null) 'game_type': gameType,
      if (difficulty != null) 'difficulty': difficulty,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (status != null) 'status': status,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GameSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? gameType,
      Value<String>? difficulty,
      Value<int>? startTime,
      Value<int?>? endTime,
      Value<String>? status,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return GameSessionsCompanion(
      id: id ?? this.id,
      gameType: gameType ?? this.gameType,
      difficulty: difficulty ?? this.difficulty,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (gameType.present) {
      map['game_type'] = Variable<String>(gameType.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameSessionsCompanion(')
          ..write('id: $id, ')
          ..write('gameType: $gameType, ')
          ..write('difficulty: $difficulty, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GameResultsTable extends GameResults
    with TableInfo<$GameResultsTable, GameResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game_sessions (id) ON DELETE CASCADE'));
  static const VerificationMeta _accuracyMeta =
      const VerificationMeta('accuracy');
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
      'accuracy', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _responseTimeMsMeta =
      const VerificationMeta('responseTimeMs');
  @override
  late final GeneratedColumn<int> responseTimeMs = GeneratedColumn<int>(
      'response_time_ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _errorsMeta = const VerificationMeta('errors');
  @override
  late final GeneratedColumn<int> errors = GeneratedColumn<int>(
      'errors', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _hintsUsedMeta =
      const VerificationMeta('hintsUsed');
  @override
  late final GeneratedColumn<int> hintsUsed = GeneratedColumn<int>(
      'hints_used', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _completionRateMeta =
      const VerificationMeta('completionRate');
  @override
  late final GeneratedColumn<double> completionRate = GeneratedColumn<double>(
      'completion_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('unsynced'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionId,
        accuracy,
        responseTimeMs,
        attempts,
        errors,
        hintsUsed,
        completionRate,
        syncStatus,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_results';
  @override
  VerificationContext validateIntegrity(Insertable<GameResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('accuracy')) {
      context.handle(_accuracyMeta,
          accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta));
    } else if (isInserting) {
      context.missing(_accuracyMeta);
    }
    if (data.containsKey('response_time_ms')) {
      context.handle(
          _responseTimeMsMeta,
          responseTimeMs.isAcceptableOrUnknown(
              data['response_time_ms']!, _responseTimeMsMeta));
    } else if (isInserting) {
      context.missing(_responseTimeMsMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    } else if (isInserting) {
      context.missing(_attemptsMeta);
    }
    if (data.containsKey('errors')) {
      context.handle(_errorsMeta,
          errors.isAcceptableOrUnknown(data['errors']!, _errorsMeta));
    } else if (isInserting) {
      context.missing(_errorsMeta);
    }
    if (data.containsKey('hints_used')) {
      context.handle(_hintsUsedMeta,
          hintsUsed.isAcceptableOrUnknown(data['hints_used']!, _hintsUsedMeta));
    } else if (isInserting) {
      context.missing(_hintsUsedMeta);
    }
    if (data.containsKey('completion_rate')) {
      context.handle(
          _completionRateMeta,
          completionRate.isAcceptableOrUnknown(
              data['completion_rate']!, _completionRateMeta));
    } else if (isInserting) {
      context.missing(_completionRateMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameResult(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      accuracy: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}accuracy'])!,
      responseTimeMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}response_time_ms'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      errors: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}errors'])!,
      hintsUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hints_used'])!,
      completionRate: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}completion_rate'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $GameResultsTable createAlias(String alias) {
    return $GameResultsTable(attachedDatabase, alias);
  }
}

class GameResult extends DataClass implements Insertable<GameResult> {
  /// Primary key — client-generated UUID v4.
  final String id;

  /// Foreign key → GameSessions.id
  final String sessionId;

  /// Correct outcomes / total attempts. Stored as REAL [0.0, 1.0].
  final double accuracy;

  /// Total session duration in milliseconds.
  final int responseTimeMs;

  /// Total attempt count (flip pairs or answer submissions).
  final int attempts;

  /// Mismatch / wrong answer count.
  final int errors;

  /// Number of times the player used the hint feature.
  final int hintsUsed;

  /// Completed rounds or pairs / total rounds or pairs. Stored as REAL [0.0, 1.0].
  final double completionRate;

  /// Sync lifecycle state. 'unsynced' | 'synced' | 'sync_failed'
  final String syncStatus;

  /// UTC epoch milliseconds when this result row was created.
  final int createdAt;
  const GameResult(
      {required this.id,
      required this.sessionId,
      required this.accuracy,
      required this.responseTimeMs,
      required this.attempts,
      required this.errors,
      required this.hintsUsed,
      required this.completionRate,
      required this.syncStatus,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['accuracy'] = Variable<double>(accuracy);
    map['response_time_ms'] = Variable<int>(responseTimeMs);
    map['attempts'] = Variable<int>(attempts);
    map['errors'] = Variable<int>(errors);
    map['hints_used'] = Variable<int>(hintsUsed);
    map['completion_rate'] = Variable<double>(completionRate);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  GameResultsCompanion toCompanion(bool nullToAbsent) {
    return GameResultsCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      accuracy: Value(accuracy),
      responseTimeMs: Value(responseTimeMs),
      attempts: Value(attempts),
      errors: Value(errors),
      hintsUsed: Value(hintsUsed),
      completionRate: Value(completionRate),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
    );
  }

  factory GameResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameResult(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      accuracy: serializer.fromJson<double>(json['accuracy']),
      responseTimeMs: serializer.fromJson<int>(json['responseTimeMs']),
      attempts: serializer.fromJson<int>(json['attempts']),
      errors: serializer.fromJson<int>(json['errors']),
      hintsUsed: serializer.fromJson<int>(json['hintsUsed']),
      completionRate: serializer.fromJson<double>(json['completionRate']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'accuracy': serializer.toJson<double>(accuracy),
      'responseTimeMs': serializer.toJson<int>(responseTimeMs),
      'attempts': serializer.toJson<int>(attempts),
      'errors': serializer.toJson<int>(errors),
      'hintsUsed': serializer.toJson<int>(hintsUsed),
      'completionRate': serializer.toJson<double>(completionRate),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  GameResult copyWith(
          {String? id,
          String? sessionId,
          double? accuracy,
          int? responseTimeMs,
          int? attempts,
          int? errors,
          int? hintsUsed,
          double? completionRate,
          String? syncStatus,
          int? createdAt}) =>
      GameResult(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        accuracy: accuracy ?? this.accuracy,
        responseTimeMs: responseTimeMs ?? this.responseTimeMs,
        attempts: attempts ?? this.attempts,
        errors: errors ?? this.errors,
        hintsUsed: hintsUsed ?? this.hintsUsed,
        completionRate: completionRate ?? this.completionRate,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
      );
  GameResult copyWithCompanion(GameResultsCompanion data) {
    return GameResult(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      responseTimeMs: data.responseTimeMs.present
          ? data.responseTimeMs.value
          : this.responseTimeMs,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      errors: data.errors.present ? data.errors.value : this.errors,
      hintsUsed: data.hintsUsed.present ? data.hintsUsed.value : this.hintsUsed,
      completionRate: data.completionRate.present
          ? data.completionRate.value
          : this.completionRate,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameResult(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('accuracy: $accuracy, ')
          ..write('responseTimeMs: $responseTimeMs, ')
          ..write('attempts: $attempts, ')
          ..write('errors: $errors, ')
          ..write('hintsUsed: $hintsUsed, ')
          ..write('completionRate: $completionRate, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, accuracy, responseTimeMs,
      attempts, errors, hintsUsed, completionRate, syncStatus, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameResult &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.accuracy == this.accuracy &&
          other.responseTimeMs == this.responseTimeMs &&
          other.attempts == this.attempts &&
          other.errors == this.errors &&
          other.hintsUsed == this.hintsUsed &&
          other.completionRate == this.completionRate &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt);
}

class GameResultsCompanion extends UpdateCompanion<GameResult> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<double> accuracy;
  final Value<int> responseTimeMs;
  final Value<int> attempts;
  final Value<int> errors;
  final Value<int> hintsUsed;
  final Value<double> completionRate;
  final Value<String> syncStatus;
  final Value<int> createdAt;
  final Value<int> rowid;
  const GameResultsCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.responseTimeMs = const Value.absent(),
    this.attempts = const Value.absent(),
    this.errors = const Value.absent(),
    this.hintsUsed = const Value.absent(),
    this.completionRate = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GameResultsCompanion.insert({
    required String id,
    required String sessionId,
    required double accuracy,
    required int responseTimeMs,
    required int attempts,
    required int errors,
    required int hintsUsed,
    required double completionRate,
    this.syncStatus = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sessionId = Value(sessionId),
        accuracy = Value(accuracy),
        responseTimeMs = Value(responseTimeMs),
        attempts = Value(attempts),
        errors = Value(errors),
        hintsUsed = Value(hintsUsed),
        completionRate = Value(completionRate),
        createdAt = Value(createdAt);
  static Insertable<GameResult> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<double>? accuracy,
    Expression<int>? responseTimeMs,
    Expression<int>? attempts,
    Expression<int>? errors,
    Expression<int>? hintsUsed,
    Expression<double>? completionRate,
    Expression<String>? syncStatus,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (accuracy != null) 'accuracy': accuracy,
      if (responseTimeMs != null) 'response_time_ms': responseTimeMs,
      if (attempts != null) 'attempts': attempts,
      if (errors != null) 'errors': errors,
      if (hintsUsed != null) 'hints_used': hintsUsed,
      if (completionRate != null) 'completion_rate': completionRate,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GameResultsCompanion copyWith(
      {Value<String>? id,
      Value<String>? sessionId,
      Value<double>? accuracy,
      Value<int>? responseTimeMs,
      Value<int>? attempts,
      Value<int>? errors,
      Value<int>? hintsUsed,
      Value<double>? completionRate,
      Value<String>? syncStatus,
      Value<int>? createdAt,
      Value<int>? rowid}) {
    return GameResultsCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      accuracy: accuracy ?? this.accuracy,
      responseTimeMs: responseTimeMs ?? this.responseTimeMs,
      attempts: attempts ?? this.attempts,
      errors: errors ?? this.errors,
      hintsUsed: hintsUsed ?? this.hintsUsed,
      completionRate: completionRate ?? this.completionRate,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (responseTimeMs.present) {
      map['response_time_ms'] = Variable<int>(responseTimeMs.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (errors.present) {
      map['errors'] = Variable<int>(errors.value);
    }
    if (hintsUsed.present) {
      map['hints_used'] = Variable<int>(hintsUsed.value);
    }
    if (completionRate.present) {
      map['completion_rate'] = Variable<double>(completionRate.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameResultsCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('accuracy: $accuracy, ')
          ..write('responseTimeMs: $responseTimeMs, ')
          ..write('attempts: $attempts, ')
          ..write('errors: $errors, ')
          ..write('hintsUsed: $hintsUsed, ')
          ..write('completionRate: $completionRate, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GameConfigsTable extends GameConfigs
    with TableInfo<$GameConfigsTable, GameConfig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameConfigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _gameTypeMeta =
      const VerificationMeta('gameType');
  @override
  late final GeneratedColumn<String> gameType = GeneratedColumn<String>(
      'game_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
      'difficulty', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 16),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _gridColumnsMeta =
      const VerificationMeta('gridColumns');
  @override
  late final GeneratedColumn<int> gridColumns = GeneratedColumn<int>(
      'grid_columns', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _gridRowsMeta =
      const VerificationMeta('gridRows');
  @override
  late final GeneratedColumn<int> gridRows = GeneratedColumn<int>(
      'grid_rows', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalRoundsMeta =
      const VerificationMeta('totalRounds');
  @override
  late final GeneratedColumn<int> totalRounds = GeneratedColumn<int>(
      'total_rounds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timeLimitSecondsMeta =
      const VerificationMeta('timeLimitSeconds');
  @override
  late final GeneratedColumn<int> timeLimitSeconds = GeneratedColumn<int>(
      'time_limit_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _revealDurationMsMeta =
      const VerificationMeta('revealDurationMs');
  @override
  late final GeneratedColumn<int> revealDurationMs = GeneratedColumn<int>(
      'reveal_duration_ms', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        gameType,
        difficulty,
        gridColumns,
        gridRows,
        totalRounds,
        timeLimitSeconds,
        revealDurationMs
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_configs';
  @override
  VerificationContext validateIntegrity(Insertable<GameConfig> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('game_type')) {
      context.handle(_gameTypeMeta,
          gameType.isAcceptableOrUnknown(data['game_type']!, _gameTypeMeta));
    } else if (isInserting) {
      context.missing(_gameTypeMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('grid_columns')) {
      context.handle(
          _gridColumnsMeta,
          gridColumns.isAcceptableOrUnknown(
              data['grid_columns']!, _gridColumnsMeta));
    } else if (isInserting) {
      context.missing(_gridColumnsMeta);
    }
    if (data.containsKey('grid_rows')) {
      context.handle(_gridRowsMeta,
          gridRows.isAcceptableOrUnknown(data['grid_rows']!, _gridRowsMeta));
    } else if (isInserting) {
      context.missing(_gridRowsMeta);
    }
    if (data.containsKey('total_rounds')) {
      context.handle(
          _totalRoundsMeta,
          totalRounds.isAcceptableOrUnknown(
              data['total_rounds']!, _totalRoundsMeta));
    } else if (isInserting) {
      context.missing(_totalRoundsMeta);
    }
    if (data.containsKey('time_limit_seconds')) {
      context.handle(
          _timeLimitSecondsMeta,
          timeLimitSeconds.isAcceptableOrUnknown(
              data['time_limit_seconds']!, _timeLimitSecondsMeta));
    } else if (isInserting) {
      context.missing(_timeLimitSecondsMeta);
    }
    if (data.containsKey('reveal_duration_ms')) {
      context.handle(
          _revealDurationMsMeta,
          revealDurationMs.isAcceptableOrUnknown(
              data['reveal_duration_ms']!, _revealDurationMsMeta));
    } else if (isInserting) {
      context.missing(_revealDurationMsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameConfig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameConfig(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      gameType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}game_type'])!,
      difficulty: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}difficulty'])!,
      gridColumns: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grid_columns'])!,
      gridRows: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grid_rows'])!,
      totalRounds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_rounds'])!,
      timeLimitSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_limit_seconds'])!,
      revealDurationMs: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}reveal_duration_ms'])!,
    );
  }

  @override
  $GameConfigsTable createAlias(String alias) {
    return $GameConfigsTable(attachedDatabase, alias);
  }
}

class GameConfig extends DataClass implements Insertable<GameConfig> {
  /// Composite natural key: (game_type, difficulty).
  /// id is still a surrogate UUID for consistent FK patterns.
  final String id;

  /// 'memory_matching' | 'pattern_recognition'
  final String gameType;

  /// 'easy' | 'medium' | 'hard'
  final String difficulty;

  /// Number of columns in the card grid.
  /// Easy=3, Medium=4, Hard=4
  final int gridColumns;

  /// Number of rows in the card grid.
  /// Easy=4, Medium=4, Hard=5
  final int gridRows;

  /// Total rounds per session.
  /// Easy=5, Medium=8, Hard=12
  final int totalRounds;

  /// Maximum session time limit in seconds. 0 = no limit.
  /// Easy=180, Medium=120, Hard=90
  final int timeLimitSeconds;

  /// Milliseconds each sequence tile is displayed during reveal phase
  /// (Pattern Recognition) or milliseconds a matched pair highlights
  /// before settling (Memory Matching).
  /// Easy=1200, Medium=900, Hard=600
  final int revealDurationMs;
  const GameConfig(
      {required this.id,
      required this.gameType,
      required this.difficulty,
      required this.gridColumns,
      required this.gridRows,
      required this.totalRounds,
      required this.timeLimitSeconds,
      required this.revealDurationMs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['game_type'] = Variable<String>(gameType);
    map['difficulty'] = Variable<String>(difficulty);
    map['grid_columns'] = Variable<int>(gridColumns);
    map['grid_rows'] = Variable<int>(gridRows);
    map['total_rounds'] = Variable<int>(totalRounds);
    map['time_limit_seconds'] = Variable<int>(timeLimitSeconds);
    map['reveal_duration_ms'] = Variable<int>(revealDurationMs);
    return map;
  }

  GameConfigsCompanion toCompanion(bool nullToAbsent) {
    return GameConfigsCompanion(
      id: Value(id),
      gameType: Value(gameType),
      difficulty: Value(difficulty),
      gridColumns: Value(gridColumns),
      gridRows: Value(gridRows),
      totalRounds: Value(totalRounds),
      timeLimitSeconds: Value(timeLimitSeconds),
      revealDurationMs: Value(revealDurationMs),
    );
  }

  factory GameConfig.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameConfig(
      id: serializer.fromJson<String>(json['id']),
      gameType: serializer.fromJson<String>(json['gameType']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      gridColumns: serializer.fromJson<int>(json['gridColumns']),
      gridRows: serializer.fromJson<int>(json['gridRows']),
      totalRounds: serializer.fromJson<int>(json['totalRounds']),
      timeLimitSeconds: serializer.fromJson<int>(json['timeLimitSeconds']),
      revealDurationMs: serializer.fromJson<int>(json['revealDurationMs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'gameType': serializer.toJson<String>(gameType),
      'difficulty': serializer.toJson<String>(difficulty),
      'gridColumns': serializer.toJson<int>(gridColumns),
      'gridRows': serializer.toJson<int>(gridRows),
      'totalRounds': serializer.toJson<int>(totalRounds),
      'timeLimitSeconds': serializer.toJson<int>(timeLimitSeconds),
      'revealDurationMs': serializer.toJson<int>(revealDurationMs),
    };
  }

  GameConfig copyWith(
          {String? id,
          String? gameType,
          String? difficulty,
          int? gridColumns,
          int? gridRows,
          int? totalRounds,
          int? timeLimitSeconds,
          int? revealDurationMs}) =>
      GameConfig(
        id: id ?? this.id,
        gameType: gameType ?? this.gameType,
        difficulty: difficulty ?? this.difficulty,
        gridColumns: gridColumns ?? this.gridColumns,
        gridRows: gridRows ?? this.gridRows,
        totalRounds: totalRounds ?? this.totalRounds,
        timeLimitSeconds: timeLimitSeconds ?? this.timeLimitSeconds,
        revealDurationMs: revealDurationMs ?? this.revealDurationMs,
      );
  GameConfig copyWithCompanion(GameConfigsCompanion data) {
    return GameConfig(
      id: data.id.present ? data.id.value : this.id,
      gameType: data.gameType.present ? data.gameType.value : this.gameType,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      gridColumns:
          data.gridColumns.present ? data.gridColumns.value : this.gridColumns,
      gridRows: data.gridRows.present ? data.gridRows.value : this.gridRows,
      totalRounds:
          data.totalRounds.present ? data.totalRounds.value : this.totalRounds,
      timeLimitSeconds: data.timeLimitSeconds.present
          ? data.timeLimitSeconds.value
          : this.timeLimitSeconds,
      revealDurationMs: data.revealDurationMs.present
          ? data.revealDurationMs.value
          : this.revealDurationMs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameConfig(')
          ..write('id: $id, ')
          ..write('gameType: $gameType, ')
          ..write('difficulty: $difficulty, ')
          ..write('gridColumns: $gridColumns, ')
          ..write('gridRows: $gridRows, ')
          ..write('totalRounds: $totalRounds, ')
          ..write('timeLimitSeconds: $timeLimitSeconds, ')
          ..write('revealDurationMs: $revealDurationMs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameType, difficulty, gridColumns,
      gridRows, totalRounds, timeLimitSeconds, revealDurationMs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameConfig &&
          other.id == this.id &&
          other.gameType == this.gameType &&
          other.difficulty == this.difficulty &&
          other.gridColumns == this.gridColumns &&
          other.gridRows == this.gridRows &&
          other.totalRounds == this.totalRounds &&
          other.timeLimitSeconds == this.timeLimitSeconds &&
          other.revealDurationMs == this.revealDurationMs);
}

class GameConfigsCompanion extends UpdateCompanion<GameConfig> {
  final Value<String> id;
  final Value<String> gameType;
  final Value<String> difficulty;
  final Value<int> gridColumns;
  final Value<int> gridRows;
  final Value<int> totalRounds;
  final Value<int> timeLimitSeconds;
  final Value<int> revealDurationMs;
  final Value<int> rowid;
  const GameConfigsCompanion({
    this.id = const Value.absent(),
    this.gameType = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.gridColumns = const Value.absent(),
    this.gridRows = const Value.absent(),
    this.totalRounds = const Value.absent(),
    this.timeLimitSeconds = const Value.absent(),
    this.revealDurationMs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GameConfigsCompanion.insert({
    required String id,
    required String gameType,
    required String difficulty,
    required int gridColumns,
    required int gridRows,
    required int totalRounds,
    required int timeLimitSeconds,
    required int revealDurationMs,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        gameType = Value(gameType),
        difficulty = Value(difficulty),
        gridColumns = Value(gridColumns),
        gridRows = Value(gridRows),
        totalRounds = Value(totalRounds),
        timeLimitSeconds = Value(timeLimitSeconds),
        revealDurationMs = Value(revealDurationMs);
  static Insertable<GameConfig> custom({
    Expression<String>? id,
    Expression<String>? gameType,
    Expression<String>? difficulty,
    Expression<int>? gridColumns,
    Expression<int>? gridRows,
    Expression<int>? totalRounds,
    Expression<int>? timeLimitSeconds,
    Expression<int>? revealDurationMs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameType != null) 'game_type': gameType,
      if (difficulty != null) 'difficulty': difficulty,
      if (gridColumns != null) 'grid_columns': gridColumns,
      if (gridRows != null) 'grid_rows': gridRows,
      if (totalRounds != null) 'total_rounds': totalRounds,
      if (timeLimitSeconds != null) 'time_limit_seconds': timeLimitSeconds,
      if (revealDurationMs != null) 'reveal_duration_ms': revealDurationMs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GameConfigsCompanion copyWith(
      {Value<String>? id,
      Value<String>? gameType,
      Value<String>? difficulty,
      Value<int>? gridColumns,
      Value<int>? gridRows,
      Value<int>? totalRounds,
      Value<int>? timeLimitSeconds,
      Value<int>? revealDurationMs,
      Value<int>? rowid}) {
    return GameConfigsCompanion(
      id: id ?? this.id,
      gameType: gameType ?? this.gameType,
      difficulty: difficulty ?? this.difficulty,
      gridColumns: gridColumns ?? this.gridColumns,
      gridRows: gridRows ?? this.gridRows,
      totalRounds: totalRounds ?? this.totalRounds,
      timeLimitSeconds: timeLimitSeconds ?? this.timeLimitSeconds,
      revealDurationMs: revealDurationMs ?? this.revealDurationMs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (gameType.present) {
      map['game_type'] = Variable<String>(gameType.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (gridColumns.present) {
      map['grid_columns'] = Variable<int>(gridColumns.value);
    }
    if (gridRows.present) {
      map['grid_rows'] = Variable<int>(gridRows.value);
    }
    if (totalRounds.present) {
      map['total_rounds'] = Variable<int>(totalRounds.value);
    }
    if (timeLimitSeconds.present) {
      map['time_limit_seconds'] = Variable<int>(timeLimitSeconds.value);
    }
    if (revealDurationMs.present) {
      map['reveal_duration_ms'] = Variable<int>(revealDurationMs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameConfigsCompanion(')
          ..write('id: $id, ')
          ..write('gameType: $gameType, ')
          ..write('difficulty: $difficulty, ')
          ..write('gridColumns: $gridColumns, ')
          ..write('gridRows: $gridRows, ')
          ..write('totalRounds: $totalRounds, ')
          ..write('timeLimitSeconds: $timeLimitSeconds, ')
          ..write('revealDurationMs: $revealDurationMs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GameSessionsTable gameSessions = $GameSessionsTable(this);
  late final $GameResultsTable gameResults = $GameResultsTable(this);
  late final $GameConfigsTable gameConfigs = $GameConfigsTable(this);
  late final GameSessionsDao gameSessionsDao =
      GameSessionsDao(this as AppDatabase);
  late final GameResultsDao gameResultsDao =
      GameResultsDao(this as AppDatabase);
  late final GameConfigsDao gameConfigsDao =
      GameConfigsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [gameSessions, gameResults, gameConfigs];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('game_sessions',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('game_results', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$GameSessionsTableCreateCompanionBuilder = GameSessionsCompanion
    Function({
  required String id,
  required String gameType,
  required String difficulty,
  required int startTime,
  Value<int?> endTime,
  required String status,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$GameSessionsTableUpdateCompanionBuilder = GameSessionsCompanion
    Function({
  Value<String> id,
  Value<String> gameType,
  Value<String> difficulty,
  Value<int> startTime,
  Value<int?> endTime,
  Value<String> status,
  Value<String> syncStatus,
  Value<int> rowid,
});

final class $$GameSessionsTableReferences
    extends BaseReferences<_$AppDatabase, $GameSessionsTable, GameSession> {
  $$GameSessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GameResultsTable, List<GameResult>>
      _gameResultsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.gameResults,
              aliasName: 'game_sessions__id__game_results__session_id');

  $$GameResultsTableProcessedTableManager get gameResultsRefs {
    final manager = $$GameResultsTableTableManager($_db, $_db.gameResults)
        .filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameResultsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GameSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $GameSessionsTable> {
  $$GameSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gameType => $composableBuilder(
      column: $table.gameType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  Expression<bool> gameResultsRefs(
      Expression<bool> Function($$GameResultsTableFilterComposer f) f) {
    final $$GameResultsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.gameResults,
        getReferencedColumn: (t) => t.sessionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameResultsTableFilterComposer(
              $db: $db,
              $table: $db.gameResults,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GameSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameSessionsTable> {
  $$GameSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gameType => $composableBuilder(
      column: $table.gameType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$GameSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameSessionsTable> {
  $$GameSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get gameType =>
      $composableBuilder(column: $table.gameType, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => column);

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  Expression<T> gameResultsRefs<T extends Object>(
      Expression<T> Function($$GameResultsTableAnnotationComposer a) f) {
    final $$GameResultsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.gameResults,
        getReferencedColumn: (t) => t.sessionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameResultsTableAnnotationComposer(
              $db: $db,
              $table: $db.gameResults,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GameSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameSessionsTable,
    GameSession,
    $$GameSessionsTableFilterComposer,
    $$GameSessionsTableOrderingComposer,
    $$GameSessionsTableAnnotationComposer,
    $$GameSessionsTableCreateCompanionBuilder,
    $$GameSessionsTableUpdateCompanionBuilder,
    (GameSession, $$GameSessionsTableReferences),
    GameSession,
    PrefetchHooks Function({bool gameResultsRefs})> {
  $$GameSessionsTableTableManager(_$AppDatabase db, $GameSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> gameType = const Value.absent(),
            Value<String> difficulty = const Value.absent(),
            Value<int> startTime = const Value.absent(),
            Value<int?> endTime = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GameSessionsCompanion(
            id: id,
            gameType: gameType,
            difficulty: difficulty,
            startTime: startTime,
            endTime: endTime,
            status: status,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String gameType,
            required String difficulty,
            required int startTime,
            Value<int?> endTime = const Value.absent(),
            required String status,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GameSessionsCompanion.insert(
            id: id,
            gameType: gameType,
            difficulty: difficulty,
            startTime: startTime,
            endTime: endTime,
            status: status,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$GameSessionsTable, GameSession>(table),
                    $$GameSessionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({gameResultsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (gameResultsRefs) db.gameResults],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (gameResultsRefs)
                    await $_getPrefetchedData<GameSession, $GameSessionsTable,
                            GameResult>(
                        currentTable: table,
                        referencedTable: $$GameSessionsTableReferences
                            ._gameResultsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GameSessionsTableReferences(db, table, p0)
                                .gameResultsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.sessionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GameSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GameSessionsTable,
    GameSession,
    $$GameSessionsTableFilterComposer,
    $$GameSessionsTableOrderingComposer,
    $$GameSessionsTableAnnotationComposer,
    $$GameSessionsTableCreateCompanionBuilder,
    $$GameSessionsTableUpdateCompanionBuilder,
    (GameSession, $$GameSessionsTableReferences),
    GameSession,
    PrefetchHooks Function({bool gameResultsRefs})>;
typedef $$GameResultsTableCreateCompanionBuilder = GameResultsCompanion
    Function({
  required String id,
  required String sessionId,
  required double accuracy,
  required int responseTimeMs,
  required int attempts,
  required int errors,
  required int hintsUsed,
  required double completionRate,
  Value<String> syncStatus,
  required int createdAt,
  Value<int> rowid,
});
typedef $$GameResultsTableUpdateCompanionBuilder = GameResultsCompanion
    Function({
  Value<String> id,
  Value<String> sessionId,
  Value<double> accuracy,
  Value<int> responseTimeMs,
  Value<int> attempts,
  Value<int> errors,
  Value<int> hintsUsed,
  Value<double> completionRate,
  Value<String> syncStatus,
  Value<int> createdAt,
  Value<int> rowid,
});

final class $$GameResultsTableReferences
    extends BaseReferences<_$AppDatabase, $GameResultsTable, GameResult> {
  $$GameResultsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GameSessionsTable _sessionIdTable(_$AppDatabase db) => db.gameSessions
      .createAlias('game_results__session_id__game_sessions__id');

  $$GameSessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $$GameSessionsTableTableManager($_db, $_db.gameSessions)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$GameResultsTableFilterComposer
    extends Composer<_$AppDatabase, $GameResultsTable> {
  $$GameResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get accuracy => $composableBuilder(
      column: $table.accuracy, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get responseTimeMs => $composableBuilder(
      column: $table.responseTimeMs,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get errors => $composableBuilder(
      column: $table.errors, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hintsUsed => $composableBuilder(
      column: $table.hintsUsed, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get completionRate => $composableBuilder(
      column: $table.completionRate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$GameSessionsTableFilterComposer get sessionId {
    final $$GameSessionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.gameSessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameSessionsTableFilterComposer(
              $db: $db,
              $table: $db.gameSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GameResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameResultsTable> {
  $$GameResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get accuracy => $composableBuilder(
      column: $table.accuracy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get responseTimeMs => $composableBuilder(
      column: $table.responseTimeMs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get errors => $composableBuilder(
      column: $table.errors, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hintsUsed => $composableBuilder(
      column: $table.hintsUsed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get completionRate => $composableBuilder(
      column: $table.completionRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$GameSessionsTableOrderingComposer get sessionId {
    final $$GameSessionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.gameSessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameSessionsTableOrderingComposer(
              $db: $db,
              $table: $db.gameSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GameResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameResultsTable> {
  $$GameResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<int> get responseTimeMs => $composableBuilder(
      column: $table.responseTimeMs, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<int> get errors =>
      $composableBuilder(column: $table.errors, builder: (column) => column);

  GeneratedColumn<int> get hintsUsed =>
      $composableBuilder(column: $table.hintsUsed, builder: (column) => column);

  GeneratedColumn<double> get completionRate => $composableBuilder(
      column: $table.completionRate, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$GameSessionsTableAnnotationComposer get sessionId {
    final $$GameSessionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sessionId,
        referencedTable: $db.gameSessions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameSessionsTableAnnotationComposer(
              $db: $db,
              $table: $db.gameSessions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GameResultsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameResultsTable,
    GameResult,
    $$GameResultsTableFilterComposer,
    $$GameResultsTableOrderingComposer,
    $$GameResultsTableAnnotationComposer,
    $$GameResultsTableCreateCompanionBuilder,
    $$GameResultsTableUpdateCompanionBuilder,
    (GameResult, $$GameResultsTableReferences),
    GameResult,
    PrefetchHooks Function({bool sessionId})> {
  $$GameResultsTableTableManager(_$AppDatabase db, $GameResultsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<double> accuracy = const Value.absent(),
            Value<int> responseTimeMs = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<int> errors = const Value.absent(),
            Value<int> hintsUsed = const Value.absent(),
            Value<double> completionRate = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GameResultsCompanion(
            id: id,
            sessionId: sessionId,
            accuracy: accuracy,
            responseTimeMs: responseTimeMs,
            attempts: attempts,
            errors: errors,
            hintsUsed: hintsUsed,
            completionRate: completionRate,
            syncStatus: syncStatus,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sessionId,
            required double accuracy,
            required int responseTimeMs,
            required int attempts,
            required int errors,
            required int hintsUsed,
            required double completionRate,
            Value<String> syncStatus = const Value.absent(),
            required int createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              GameResultsCompanion.insert(
            id: id,
            sessionId: sessionId,
            accuracy: accuracy,
            responseTimeMs: responseTimeMs,
            attempts: attempts,
            errors: errors,
            hintsUsed: hintsUsed,
            completionRate: completionRate,
            syncStatus: syncStatus,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$GameResultsTable, GameResult>(table),
                    $$GameResultsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (sessionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sessionId,
                    referencedTable:
                        $$GameResultsTableReferences._sessionIdTable(db),
                    referencedColumn:
                        $$GameResultsTableReferences._sessionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$GameResultsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GameResultsTable,
    GameResult,
    $$GameResultsTableFilterComposer,
    $$GameResultsTableOrderingComposer,
    $$GameResultsTableAnnotationComposer,
    $$GameResultsTableCreateCompanionBuilder,
    $$GameResultsTableUpdateCompanionBuilder,
    (GameResult, $$GameResultsTableReferences),
    GameResult,
    PrefetchHooks Function({bool sessionId})>;
typedef $$GameConfigsTableCreateCompanionBuilder = GameConfigsCompanion
    Function({
  required String id,
  required String gameType,
  required String difficulty,
  required int gridColumns,
  required int gridRows,
  required int totalRounds,
  required int timeLimitSeconds,
  required int revealDurationMs,
  Value<int> rowid,
});
typedef $$GameConfigsTableUpdateCompanionBuilder = GameConfigsCompanion
    Function({
  Value<String> id,
  Value<String> gameType,
  Value<String> difficulty,
  Value<int> gridColumns,
  Value<int> gridRows,
  Value<int> totalRounds,
  Value<int> timeLimitSeconds,
  Value<int> revealDurationMs,
  Value<int> rowid,
});

class $$GameConfigsTableFilterComposer
    extends Composer<_$AppDatabase, $GameConfigsTable> {
  $$GameConfigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gameType => $composableBuilder(
      column: $table.gameType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get gridColumns => $composableBuilder(
      column: $table.gridColumns, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get gridRows => $composableBuilder(
      column: $table.gridRows, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalRounds => $composableBuilder(
      column: $table.totalRounds, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeLimitSeconds => $composableBuilder(
      column: $table.timeLimitSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get revealDurationMs => $composableBuilder(
      column: $table.revealDurationMs,
      builder: (column) => ColumnFilters(column));
}

class $$GameConfigsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameConfigsTable> {
  $$GameConfigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gameType => $composableBuilder(
      column: $table.gameType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get gridColumns => $composableBuilder(
      column: $table.gridColumns, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get gridRows => $composableBuilder(
      column: $table.gridRows, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalRounds => $composableBuilder(
      column: $table.totalRounds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeLimitSeconds => $composableBuilder(
      column: $table.timeLimitSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get revealDurationMs => $composableBuilder(
      column: $table.revealDurationMs,
      builder: (column) => ColumnOrderings(column));
}

class $$GameConfigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameConfigsTable> {
  $$GameConfigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get gameType =>
      $composableBuilder(column: $table.gameType, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => column);

  GeneratedColumn<int> get gridColumns => $composableBuilder(
      column: $table.gridColumns, builder: (column) => column);

  GeneratedColumn<int> get gridRows =>
      $composableBuilder(column: $table.gridRows, builder: (column) => column);

  GeneratedColumn<int> get totalRounds => $composableBuilder(
      column: $table.totalRounds, builder: (column) => column);

  GeneratedColumn<int> get timeLimitSeconds => $composableBuilder(
      column: $table.timeLimitSeconds, builder: (column) => column);

  GeneratedColumn<int> get revealDurationMs => $composableBuilder(
      column: $table.revealDurationMs, builder: (column) => column);
}

class $$GameConfigsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameConfigsTable,
    GameConfig,
    $$GameConfigsTableFilterComposer,
    $$GameConfigsTableOrderingComposer,
    $$GameConfigsTableAnnotationComposer,
    $$GameConfigsTableCreateCompanionBuilder,
    $$GameConfigsTableUpdateCompanionBuilder,
    (GameConfig, BaseReferences<_$AppDatabase, $GameConfigsTable, GameConfig>),
    GameConfig,
    PrefetchHooks Function()> {
  $$GameConfigsTableTableManager(_$AppDatabase db, $GameConfigsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameConfigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameConfigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameConfigsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> gameType = const Value.absent(),
            Value<String> difficulty = const Value.absent(),
            Value<int> gridColumns = const Value.absent(),
            Value<int> gridRows = const Value.absent(),
            Value<int> totalRounds = const Value.absent(),
            Value<int> timeLimitSeconds = const Value.absent(),
            Value<int> revealDurationMs = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GameConfigsCompanion(
            id: id,
            gameType: gameType,
            difficulty: difficulty,
            gridColumns: gridColumns,
            gridRows: gridRows,
            totalRounds: totalRounds,
            timeLimitSeconds: timeLimitSeconds,
            revealDurationMs: revealDurationMs,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String gameType,
            required String difficulty,
            required int gridColumns,
            required int gridRows,
            required int totalRounds,
            required int timeLimitSeconds,
            required int revealDurationMs,
            Value<int> rowid = const Value.absent(),
          }) =>
              GameConfigsCompanion.insert(
            id: id,
            gameType: gameType,
            difficulty: difficulty,
            gridColumns: gridColumns,
            gridRows: gridRows,
            totalRounds: totalRounds,
            timeLimitSeconds: timeLimitSeconds,
            revealDurationMs: revealDurationMs,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$GameConfigsTable, GameConfig>(table),
                    BaseReferences<_$AppDatabase, $GameConfigsTable,
                        GameConfig>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GameConfigsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GameConfigsTable,
    GameConfig,
    $$GameConfigsTableFilterComposer,
    $$GameConfigsTableOrderingComposer,
    $$GameConfigsTableAnnotationComposer,
    $$GameConfigsTableCreateCompanionBuilder,
    $$GameConfigsTableUpdateCompanionBuilder,
    (GameConfig, BaseReferences<_$AppDatabase, $GameConfigsTable, GameConfig>),
    GameConfig,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GameSessionsTableTableManager get gameSessions =>
      $$GameSessionsTableTableManager(_db, _db.gameSessions);
  $$GameResultsTableTableManager get gameResults =>
      $$GameResultsTableTableManager(_db, _db.gameResults);
  $$GameConfigsTableTableManager get gameConfigs =>
      $$GameConfigsTableTableManager(_db, _db.gameConfigs);
}
