import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ConnectivityPolar {
  static const MethodChannel _channel =
  const MethodChannel('connectivity_polar');
  static const EventChannel connection = const EventChannel('connectionStream');

  static Future<String> get restart async {
    final String version = await _channel.invokeMethod('restart');
    return version;
  }static Future<bool> get enable async {
    final bool version = await _channel.invokeMethod('enable');
    return version;
  }

  static Future<bool> get CheckBluetooth async {
    final bool version = await _channel.invokeMethod('checkBTPower');
    return version;
  }

  static Future<bool> get CheckLocation async {
    final bool version = await _channel.invokeMethod('checklocation');
    return version;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get disconnect async {
    final String version = await _channel.invokeMethod('disconnect');
    return version;
  }

  static Future<bool>  connectToDevice(String id) async {
    final bool version = await _channel.invokeMethod('connect',{"id":id});
    return version;
  }

  static Future<bool> get initCalc async {
    final bool version = await _channel.invokeMethod('initCalc');
    return version;
  }

  static Future<String>  getMeasurements(int hr,List<int> rrs) async {

    final String version = await _channel.invokeMethod('getMeasurement',{"hr":hr,"rrs":rrs});
    return version;
  }
  static Future<String>  getMeasuremsents(BluetoothCharacteristic characteristic) async {
   String data=  json.encode(characteristic);
    final String version = await _channel.invokeMethod('getMeasurement',{"hr":data});
    return version;
  }

  static Future<bool>  pairToDevice(String id) async {
    final bool version = await _channel.invokeMethod('pair',{"deviceId":id});
    return version;
  }

  static Future<String> get initiateConnection async {
    final String version = await _channel.invokeMethod('initiate');
    return version;
  }

  static Future<bool> checkIfAlreadyConnected(String id) async {

    final bool version = await _channel.invokeMethod('checkConnected',{"deviceId":id});
    return version;
  }


  static Future<String> get finishConnection async {
    final String version = await _channel.invokeMethod('finish');
    return version;
  }

  static Stream<dynamic> connect(String id,int type) {
    Stream<dynamic> version = connection.receiveBroadcastStream("connect,$id,$type");
    return version;
  }

  static Stream<dynamic> results() {
    Stream<dynamic> version = connection.receiveBroadcastStream("results");
    return version;
  }


  static Stream<dynamic> get scanForDevice {
    Stream<dynamic> version = connection.receiveBroadcastStream("scan,0");
    return version;
  }

  static Stream<dynamic> get stopScan {
    Stream<dynamic> version = connection.receiveBroadcastStream("stopscan,0");
    return version;
  }

  static Future<String> get getState async {
    final String version = await _channel.invokeMethod('state');
    return version;
  }



  //region Calulations
  static Future<String> get getAmplitude async {
    final String version = await _channel.invokeMethod('getAmplitude');
    return version;
  }

//end
}
