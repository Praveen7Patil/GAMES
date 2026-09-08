// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_configs_dao.dart';

// ignore_for_file: type=lint
mixin _$GameConfigsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GameConfigsTable get gameConfigs => attachedDatabase.gameConfigs;
  GameConfigsDaoManager get managers => GameConfigsDaoManager(this);
}

class GameConfigsDaoManager {
  final _$GameConfigsDaoMixin _db;
  GameConfigsDaoManager(this._db);
  $$GameConfigsTableTableManager get gameConfigs =>
      $$GameConfigsTableTableManager(_db.attachedDatabase, _db.gameConfigs);
}
