import 'package:biocheck/db/entities/connection.dart';
import 'package:biocheck/db/repository/connection_repo.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {

  var connection = Connection.fromConnection();
  setConnection(Connection connection) async {
    await ConnectionRepo.instance.mapConnection(connection);
  }

  Future<Connection> getConnection() async {
     connection = await ConnectionRepo.instance.getConnection();
    return connection;
  }



}
