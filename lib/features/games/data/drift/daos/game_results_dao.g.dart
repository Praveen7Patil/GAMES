// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_results_dao.dart';

// ignore_for_file: type=lint
mixin _$GameResultsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GameSessionsTable get gameSessions => attachedDatabase.gameSessions;
  $GameResultsTable get gameResults => attachedDatabase.gameResults;
  GameResultsDaoManager get managers => GameResultsDaoManager(this);
}

class GameResultsDaoManager {
  final _$GameResultsDaoMixin _db;
  GameResultsDaoManager(this._db);
  $$GameSessionsTableTableManager get gameSessions =>
      $$GameSessionsTableTableManager(_db.attachedDatabase, _db.gameSessions);
  $$GameResultsTableTableManager get gameResults =>
      $$GameResultsTableTableManager(_db.attachedDatabase, _db.gameResults);
}
