import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayer/audioplayer.dart';
import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/preferences.dart';
import 'package:biocheck/controllers/infrastructure/common/biocheck_singlton.dart';
import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class TTSController extends GetxController
{
  var tts = FlutterTTS();
  var flutterTts = FlutterTts();

  double volume = 0.5;
  double pitch = 0.5;
  double rate = 0.8;
  Future  speak(String _newVoiceText) async {
    String locale = await SharedPref.read(Constants.appLocale);;
    String strLng;
    String strVoice;
    if(locale == Constants.EN) {
      strLng = "en-US";
      strVoice = "en-US-Wavenet-H";
    }
    else if(locale == Constants.BG) {
      strLng = "en-GB";
      strVoice = "en-gb-x-gbg-local";
    }
    else if(locale == Constants.FR) {
      strLng = "fr-FR";
      strVoice = "fr-fr-x-frd-local";
    }
    else {
      strLng = "nl-NL";
      strVoice = "nl-NL-Wavenet-D";
    }
    // await flutterTts.setLanguage("en-US");
    // await flutterTts.setVoice({"name": "en-US-Wavenet-D", "locale": "en-US"});
    // await flutterTts.setSpeechRate(rate);
    // await flutterTts.setPitch(pitch);
    // if (_newVoiceText != null) {
    //   if (_newVoiceText.isNotEmpty) {
    //     await flutterTts.awaitSpeakCompletion(true);
    //     await flutterTts.speak(_newVoiceText);
    //   }
    // }
    await synthesizeText1(_newVoiceText,strLng,strVoice);

/*
    IamOptions options = await IamOptions(iamApiKey: "B0tyV81SPIqi96FimCLFTG9dBUp5KonQ08fq0bN4Y6nj", url: "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/11893174-a857-4f63-9683-9b37f12a6923").build();
    TextToSpeech service = new TextToSpeech(iamOptions: options);
    service.setVoice("en-US_HenryV3Voice");
    Uint8List bi = await service.toSpeech(_newVoiceText);*/
  }
  AudioPlayer audioPlugin = AudioPlayer();

  void synthesizeText1(String text, String name,String male) async {
    if (audioPlugin.state == AudioPlayerState.PLAYING) {
      await audioPlugin.stop();
    }
    final String audioContent = await TextToSpeechAPI().synthesizeText(text, male, name);
    if (audioContent == null) return;
    final bytes = Base64Decoder().convert(audioContent, 0, audioContent.length);
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/wavenet.mp3');
    await file.writeAsBytes(bytes);
    await audioPlugin.play(file.path, isLocal: true);
  }
}

class TextToSpeechAPI {

  static final TextToSpeechAPI _singleton = TextToSpeechAPI._internal();
  final _httpClient = HttpClient();
  static const _apiKey = "AIzaSyDxmkPSeT05ufqs19hJ408LEOMmhufQRZE";
  static const _apiURL = "texttospeech.googleapis.com";


  factory TextToSpeechAPI() {
    return _singleton;
  }

  TextToSpeechAPI._internal();

  Future<dynamic> synthesizeText(String text, String name, String languageCode) async {
    try {
      final uri = Uri.https(_apiURL, '/v1beta1/text:synthesize');
      final Map json = {
        'input': {
          'text': text
        },
        'voice': {
          'name': name,
          'languageCode': languageCode
        },
        'audioConfig': {
          'audioEncoding': 'MP3'
        }
      };

      final jsonResponse = await _postJson(uri, json);
      if (jsonResponse == null) return null;
      final String audioContent = await jsonResponse['audioContent'];
      return audioContent;
    } on Exception catch(e) {
      print("$e");
      return null;
    }
  }



  Future<Map<String, dynamic>> _postJson(Uri uri, Map jsonMap) async {
    try {
      final httpRequest = await _httpClient.postUrl(uri);
      final jsonData = utf8.encode(json.encode(jsonMap));
      final jsonResponse = await _processRequestIntoJsonResponse(httpRequest, jsonData);
      return jsonResponse;
    } on Exception catch(e) {
      print("$e");
      return null;
    }
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final jsonResponse = await _processRequestIntoJsonResponse(httpRequest, null);
      return jsonResponse;
    } on Exception catch(e) {
      print("$e");
      return null;
    }
  }

  Future<Map<String, dynamic>> _processRequestIntoJsonResponse(HttpClientRequest httpRequest, List<int> data) async {
    try {
      httpRequest.headers.add('X-Goog-Api-Key', _apiKey);
      httpRequest.headers.add(HttpHeaders.CONTENT_TYPE, 'application/json');
      if (data != null) {
        httpRequest.add(data);
      }
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        throw Exception('Bad Response');
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch(e) {
      print("$e");
      return null;
    }
  }



}

class Voice
{
  final String name;
  final String gender;
  final List<String> languageCodes;

  Voice(this.name, this.gender, this.languageCodes);

  static List<Voice> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList.map((v) {
      return Voice(v['name'], v['ssmlGender'], List<String>.from(v['languageCodes']));
    }).toList();
  }
}