import 'package:flutter_blue/flutter_blue.dart';

class BluetoothManager{
  static FlutterBlue getInstance() {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    return flutterBlue;
  }

  static getDevices()
  {
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));

// Listen to scan results
   getInstance().scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

// Stop scanning
    getInstance().stopScan();
  }

  static connectToDevice(BluetoothDevice device)async
  {
    // Connect to the device
    await device.connect();

// Disconnect from device

  }

  static disconnectDevice(BluetoothDevice device)async
  {
    // Connect to the device
    await device.connect();

// Disconnect from device

  }

  static Future<List<BluetoothService>> findBluetoothServices(BluetoothDevice device)async
  {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      // do something with service
    });
  }
  static Future<List<BluetoothService>> findBluetoothMTU(BluetoothDevice device)async
  {
    final mtu = await device.mtu.first;
    await device.requestMtu(512);
  }
}
