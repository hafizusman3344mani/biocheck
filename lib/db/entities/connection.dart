import 'package:floor/floor.dart';

@entity
class Connection {
  @PrimaryKey(autoGenerate: true)
  int id;
  bool isConnected;
  String ConnectionId;
  String ConnectedDeviceName;
  String ConnectedUserDeviceName;
  int ConnetionSdk;

  Connection(
      this.id,
      this.isConnected,
      this.ConnectionId,
      this.ConnectedDeviceName,
      this.ConnectedUserDeviceName,
      this.ConnetionSdk);

  Connection.fromConnection();
}
