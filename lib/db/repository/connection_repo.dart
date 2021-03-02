import 'package:biocheck/db/dao/connection_dao.dart';
import 'package:biocheck/db/dao/user_dao.dart';
import 'package:biocheck/db/database/database_handler.dart';
import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/entities/user_entity.dart';
import 'package:biocheck/models/apimodels/authorization/authorization_response.dart';
import 'package:biocheck/models/local/result.dart';

class ConnectionRepo {
  ConnectionDao connectionDao;

  ConnectionRepo._privateConstructor();

  static final ConnectionRepo instance = ConnectionRepo._privateConstructor();

  _setConnectionDao() {
    if (connectionDao == null)
      connectionDao = DBManager.instance.database.connectionDao;
  }

  Future<Connection> mapConnection(Connection connection) async {
    await DBManager.instance.getDB();
    _setConnectionDao();
    await _insertConnection(connection);
    return connection;
  }

  _insertConnection(Connection connection) async {
    await connectionDao.insertConnection(connection);
  }

  Future<Connection> getConnection() async {
    try {
      await DBManager.instance.getDB();
      _setConnectionDao();
      List<Connection> result = await connectionDao.findConnection();
      if (result != null) {
        if (result.isNotEmpty)
          return result[0];
        else
          return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  deleteConnection() async {
    await DBManager.instance.getDB();
    _setConnectionDao();
    await connectionDao.deleteConnections();
  }
}
