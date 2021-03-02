// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao _userDaoInstance;

  ConnectionDao _connectionDaoInstance;

  RestMeasureDao _restDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `PersonId` INTEGER, `UserName` TEXT, `Password` TEXT, `FranchiseId` INTEGER, `CanViewPhysicalStatusInfo` INTEGER, `AllowMobileAccess` INTEGER, `AllowWebAccess` INTEGER, `AllowHistory` INTEGER, `AllowZeroCheck` INTEGER, `AllowFreeZeroCheck` INTEGER, `AllowCvp` INTEGER, `AllowFreeTraining` INTEGER, `Token` TEXT, `ExpirationDateAsString` TEXT, `TokenIsValid` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Connection` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `isConnected` INTEGER, `ConnectionId` TEXT, `ConnectedDeviceName` TEXT, `ConnectedUserDeviceName` TEXT, `ConnetionSdk` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RestMeasurementEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `startTime` INTEGER, `endTime` INTEGER, `hr` INTEGER, `amp` INTEGER, `stressLevel` INTEGER, `stressLevelString` TEXT, `timeElapse` TEXT, `timeStressRelax` TEXT, `timeStressNormal` TEXT, `timeStressLow` TEXT, `timeStressHeavy` TEXT, `percStressHeavy` INTEGER, `percStressRelax` INTEGER, `percStressNormal` INTEGER, `percStressLow` INTEGER, `createdDate` INTEGER, `completed` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RestQuestionnaire` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `mId` INTEGER, `qID` INTEGER, `qIDString` TEXT, `rating` REAL, `notes` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  ConnectionDao get connectionDao {
    return _connectionDaoInstance ??= _$ConnectionDao(database, changeListener);
  }

  @override
  RestMeasureDao get restDao {
    return _restDaoInstance ??= _$RestMeasureDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userEntityInsertionAdapter = InsertionAdapter(
            database,
            'UserEntity',
            (UserEntity item) => <String, dynamic>{
                  'id': item.id,
                  'PersonId': item.PersonId,
                  'UserName': item.UserName,
                  'Password': item.Password,
                  'FranchiseId': item.FranchiseId,
                  'CanViewPhysicalStatusInfo':
                      item.CanViewPhysicalStatusInfo == null
                          ? null
                          : (item.CanViewPhysicalStatusInfo ? 1 : 0),
                  'AllowMobileAccess': item.AllowMobileAccess == null
                      ? null
                      : (item.AllowMobileAccess ? 1 : 0),
                  'AllowWebAccess': item.AllowWebAccess == null
                      ? null
                      : (item.AllowWebAccess ? 1 : 0),
                  'AllowHistory': item.AllowHistory == null
                      ? null
                      : (item.AllowHistory ? 1 : 0),
                  'AllowZeroCheck': item.AllowZeroCheck == null
                      ? null
                      : (item.AllowZeroCheck ? 1 : 0),
                  'AllowFreeZeroCheck': item.AllowFreeZeroCheck == null
                      ? null
                      : (item.AllowFreeZeroCheck ? 1 : 0),
                  'AllowCvp':
                      item.AllowCvp == null ? null : (item.AllowCvp ? 1 : 0),
                  'AllowFreeTraining': item.AllowFreeTraining == null
                      ? null
                      : (item.AllowFreeTraining ? 1 : 0),
                  'Token': item.Token,
                  'ExpirationDateAsString': item.ExpirationDateAsString,
                  'TokenIsValid': item.TokenIsValid == null
                      ? null
                      : (item.TokenIsValid ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserEntity> _userEntityInsertionAdapter;

  @override
  Future<List<UserEntity>> findUser() async {
    return _queryAdapter.queryList('SELECT * FROM UserEntity',
        mapper: (Map<String, dynamic> row) => UserEntity(
            row['id'] as int,
            row['PersonId'] as int,
            row['UserName'] as String,
            row['Password'] as String,
            row['FranchiseId'] as int,
            row['CanViewPhysicalStatusInfo'] == null
                ? null
                : (row['CanViewPhysicalStatusInfo'] as int) != 0,
            row['AllowMobileAccess'] == null
                ? null
                : (row['AllowMobileAccess'] as int) != 0,
            row['AllowWebAccess'] == null
                ? null
                : (row['AllowWebAccess'] as int) != 0,
            row['AllowHistory'] == null
                ? null
                : (row['AllowHistory'] as int) != 0,
            row['AllowZeroCheck'] == null
                ? null
                : (row['AllowZeroCheck'] as int) != 0,
            row['AllowFreeZeroCheck'] == null
                ? null
                : (row['AllowFreeZeroCheck'] as int) != 0,
            row['AllowCvp'] == null ? null : (row['AllowCvp'] as int) != 0,
            row['AllowFreeTraining'] == null
                ? null
                : (row['AllowFreeTraining'] as int) != 0,
            row['Token'] as String,
            row['ExpirationDateAsString'] as String,
            row['TokenIsValid'] == null
                ? null
                : (row['TokenIsValid'] as int) != 0));
  }

  @override
  Future<void> deleteUser() async {
    await _queryAdapter.queryNoReturn('DELETE FROM UserEntity');
  }

  @override
  Future<void> insertUserEntity(UserEntity user) async {
    await _userEntityInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }
}

class _$ConnectionDao extends ConnectionDao {
  _$ConnectionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _connectionInsertionAdapter = InsertionAdapter(
            database,
            'Connection',
            (Connection item) => <String, dynamic>{
                  'id': item.id,
                  'isConnected': item.isConnected == null
                      ? null
                      : (item.isConnected ? 1 : 0),
                  'ConnectionId': item.ConnectionId,
                  'ConnectedDeviceName': item.ConnectedDeviceName,
                  'ConnectedUserDeviceName': item.ConnectedUserDeviceName,
                  'ConnetionSdk': item.ConnetionSdk
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Connection> _connectionInsertionAdapter;

  @override
  Future<List<Connection>> findConnection() async {
    return _queryAdapter.queryList('SELECT * FROM Connection',
        mapper: (Map<String, dynamic> row) => Connection(
            row['id'] as int,
            row['isConnected'] == null
                ? null
                : (row['isConnected'] as int) != 0,
            row['ConnectionId'] as String,
            row['ConnectedDeviceName'] as String,
            row['ConnectedUserDeviceName'] as String,
            row['ConnetionSdk'] as int));
  }

  @override
  Future<void> deleteConnections() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Connection');
  }

  @override
  Future<void> insertConnection(Connection connection) async {
    await _connectionInsertionAdapter.insert(
        connection, OnConflictStrategy.abort);
  }
}

class _$RestMeasureDao extends RestMeasureDao {
  _$RestMeasureDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _restMeasurementEntityInsertionAdapter = InsertionAdapter(
            database,
            'RestMeasurementEntity',
            (RestMeasurementEntity item) => <String, dynamic>{
                  'id': item.id,
                  'startTime': item.startTime,
                  'endTime': item.endTime,
                  'hr': item.hr,
                  'amp': item.amp,
                  'stressLevel': item.stressLevel,
                  'stressLevelString': item.stressLevelString,
                  'timeElapse': item.timeElapse,
                  'timeStressRelax': item.timeStressRelax,
                  'timeStressNormal': item.timeStressNormal,
                  'timeStressLow': item.timeStressLow,
                  'timeStressHeavy': item.timeStressHeavy,
                  'percStressHeavy': item.percStressHeavy,
                  'percStressRelax': item.percStressRelax,
                  'percStressNormal': item.percStressNormal,
                  'percStressLow': item.percStressLow,
                  'createdDate': item.createdDate,
                  'completed':
                      item.completed == null ? null : (item.completed ? 1 : 0)
                }),
        _restQuestionnaireInsertionAdapter = InsertionAdapter(
            database,
            'RestQuestionnaire',
            (RestQuestionnaire item) => <String, dynamic>{
                  'id': item.id,
                  'mId': item.mId,
                  'qID': item.qID,
                  'qIDString': item.qIDString,
                  'rating': item.rating,
                  'notes': item.notes
                }),
        _restQuestionnaireUpdateAdapter = UpdateAdapter(
            database,
            'RestQuestionnaire',
            ['id'],
            (RestQuestionnaire item) => <String, dynamic>{
                  'id': item.id,
                  'mId': item.mId,
                  'qID': item.qID,
                  'qIDString': item.qIDString,
                  'rating': item.rating,
                  'notes': item.notes
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RestMeasurementEntity>
      _restMeasurementEntityInsertionAdapter;

  final InsertionAdapter<RestQuestionnaire> _restQuestionnaireInsertionAdapter;

  final UpdateAdapter<RestQuestionnaire> _restQuestionnaireUpdateAdapter;

  @override
  Future<List<RestMeasurementEntity>> findMeasurement() async {
    return _queryAdapter.queryList('SELECT * FROM RestMeasurementEntity',
        mapper: (Map<String, dynamic> row) => RestMeasurementEntity(
            row['id'] as int,
            row['startTime'] as int,
            row['endTime'] as int,
            row['hr'] as int,
            row['amp'] as double,
            row['stressLevel'] as int,
            row['stressLevelString'] as String,
            row['timeElapse'] as String,
            row['timeStressRelax'] as String,
            row['timeStressNormal'] as String,
            row['timeStressLow'] as String,
            row['timeStressHeavy'] as String,
            row['percStressHeavy'] as int,
            row['percStressRelax'] as int,
            row['percStressNormal'] as int,
            row['percStressLow'] as int,
            row['createdDate'] as int,
            row['completed'] == null ? null : (row['completed'] as int) != 0));
  }

  @override
  Future<List<RestMeasurementEntity>> findMeasurementById(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM RestMeasurementEntity WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => RestMeasurementEntity(
            row['id'] as int,
            row['startTime'] as int,
            row['endTime'] as int,
            row['hr'] as int,
            row['amp'] as double,
            row['stressLevel'] as int,
            row['stressLevelString'] as String,
            row['timeElapse'] as String,
            row['timeStressRelax'] as String,
            row['timeStressNormal'] as String,
            row['timeStressLow'] as String,
            row['timeStressHeavy'] as String,
            row['percStressHeavy'] as int,
            row['percStressRelax'] as int,
            row['percStressNormal'] as int,
            row['percStressLow'] as int,
            row['createdDate'] as int,
            row['completed'] == null ? null : (row['completed'] as int) != 0));
  }

  @override
  Future<List<RestQuestionnaire>> findMeasurementQues(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM RestQuestionnaire WHERE mId = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => RestQuestionnaire(
            row['id'] as int,
            row['mId'] as int,
            row['qID'] as int,
            row['qIDString'] as String,
            row['rating'] as double,
            row['notes'] as String));
  }

  @override
  Future<int> insertRestMeasurement(RestMeasurementEntity user) {
    return _restMeasurementEntityInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertRestMeasurementQues(RestQuestionnaire user) async {
    await _restQuestionnaireInsertionAdapter.insert(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMeasurementQuesById(
      RestQuestionnaire questionnaire) async {
    await _restQuestionnaireUpdateAdapter.update(
        questionnaire, OnConflictStrategy.abort);
  }
}
