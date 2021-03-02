import 'package:biocheck/db/entities/connection.dart';
import 'package:floor/floor.dart';

import '../queries.dart';

@dao
abstract class ConnectionDao {
  @Query(DBQueries.findConnectionSettings)
  Future<List<Connection>> findConnection();

  @insert
  Future<void> insertConnection(Connection connection);

  @Query(DBQueries.deleteConnections)
  Future<void> deleteConnections();
}