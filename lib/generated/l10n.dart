// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome`
  String get welcomeTitle {
    return Intl.message(
      'Welcome',
      name: 'welcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get welcomeButtonTitle {
    return Intl.message(
      'Start',
      name: 'welcomeButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account? Then sign up here.`
  String get welcomeNoAccount {
    return Intl.message(
      'Do not have an account? Then sign up here.',
      name: 'welcomeNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `By logging in you agree with our`
  String get welcomeTerms1 {
    return Intl.message(
      'By logging in you agree with our',
      name: 'welcomeTerms1',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get welcomeTerms2 {
    return Intl.message(
      'Terms and Conditions',
      name: 'welcomeTerms2',
      desc: '',
      args: [],
    );
  }

  /// `	en	`
  String get welcomeTerms3 {
    return Intl.message(
      '	en	',
      name: 'welcomeTerms3',
      desc: '',
      args: [],
    );
  }

  /// `Privacy declaration`
  String get welcomeTerms4 {
    return Intl.message(
      'Privacy declaration',
      name: 'welcomeTerms4',
      desc: '',
      args: [],
    );
  }

  /// `BioCheck is a method to help improve your recovery capacity at rest. \n \nIf you are better able to recover at rest, you can better process mental processes, you are more resilient, you have more energy and you are less vulnerable to for example \n infections and viruses.`
  String get welcomeDescription {
    return Intl.message(
      'BioCheck is a method to help improve your recovery capacity at rest. \n \nIf you are better able to recover at rest, you can better process mental processes, you are more resilient, you have more energy and you are less vulnerable to for example \n infections and viruses.',
      name: 'welcomeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Establishment`
  String get loginHintEstablishment {
    return Intl.message(
      'Establishment',
      name: 'loginHintEstablishment',
      desc: '',
      args: [],
    );
  }

  /// `your@emailaddress.com`
  String get loginHintEmail {
    return Intl.message(
      'your@emailaddress.com',
      name: 'loginHintEmail',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get loginHintWachtwoord {
    return Intl.message(
      'password',
      name: 'loginHintWachtwoord',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get loginButtonTitle {
    return Intl.message(
      'login',
      name: 'loginButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get loginForgotPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Listening to your body`
  String get slider1Title {
    return Intl.message(
      'Listening to your body',
      name: 'slider1Title',
      desc: '',
      args: [],
    );
  }

  /// `By using the BioCheck app as a mirror \nto your body, you will understand your body better. Your \nbody has 2 great tools for balancing itself. Breathing and moving. And we're going to teach you how to use them better.`
  String get slider1Description {
    return Intl.message(
      'By using the BioCheck app as a mirror \nto your body, you will understand your body better. Your \nbody has 2 great tools for balancing itself. Breathing and moving. And we\'re going to teach you how to use them better.',
      name: 'slider1Description',
      desc: '',
      args: [],
    );
  }

  /// `Breathing`
  String get slider2Title {
    return Intl.message(
      'Breathing',
      name: 'slider2Title',
      desc: '',
      args: [],
    );
  }

  /// `Breathing is one of the most important tools available to you \nto influence your autonomic nervous system. Only when the activity of this \nsystem decreases at rest can your body relax and \nstart recovering. Without recovery you will be exhausted \nand no progress is possible.`
  String get slider2Description {
    return Intl.message(
      'Breathing is one of the most important tools available to you \nto influence your autonomic nervous system. Only when the activity of this \nsystem decreases at rest can your body relax and \nstart recovering. Without recovery you will be exhausted \nand no progress is possible.',
      name: 'slider2Description',
      desc: '',
      args: [],
    );
  }

  /// `To move`
  String get slider3Title {
    return Intl.message(
      'To move',
      name: 'slider3Title',
      desc: '',
      args: [],
    );
  }

  /// `In today's society we do experience a lot of stress and mental activity and very little physical activity. Naturally, after a stress reaction, a physical reaction, such as fleeing or fighting, should take place, \n which keeps your system in balance. By letting you move within your resilience of that day, we \nhelp your body to reprogram.`
  String get slider3Description {
    return Intl.message(
      'In today\'s society we do experience a lot of stress and mental activity and very little physical activity. Naturally, after a stress reaction, a physical reaction, such as fleeing or fighting, should take place, \n which keeps your system in balance. By letting you move within your resilience of that day, we \nhelp your body to reprogram.',
      name: 'slider3Description',
      desc: '',
      args: [],
    );
  }

  /// `To skip`
  String get sliderScreenButton {
    return Intl.message(
      'To skip',
      name: 'sliderScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to do a measurement or a training? \nThen follow the steps below.`
  String get dashboard1Title1 {
    return Intl.message(
      'Do you want to do a measurement or a training? \nThen follow the steps below.',
      name: 'dashboard1Title1',
      desc: '',
      args: [],
    );
  }

  /// `Step 1 \n Connect to \n your heart rate belt`
  String get dashboard1Title2 {
    return Intl.message(
      'Step 1 \n Connect to \n your heart rate belt',
      name: 'dashboard1Title2',
      desc: '',
      args: [],
    );
  }

  /// `Step 2 \n Select \n your heart rate belt`
  String get dashboard1TitleStep2 {
    return Intl.message(
      'Step 2 \n Select \n your heart rate belt',
      name: 'dashboard1TitleStep2',
      desc: '',
      args: [],
    );
  }

  /// `Step 3`
  String get dashboard1TitleStep3 {
    return Intl.message(
      'Step 3',
      name: 'dashboard1TitleStep3',
      desc: '',
      args: [],
    );
  }

  /// `Configure`
  String get dashboard1TitleStep3a {
    return Intl.message(
      'Configure',
      name: 'dashboard1TitleStep3a',
      desc: '',
      args: [],
    );
  }

  /// `Step 4 \n You are connected \n to your heart rate belt`
  String get dashboard1TitleStep4 {
    return Intl.message(
      'Step 4 \n You are connected \n to your heart rate belt',
      name: 'dashboard1TitleStep4',
      desc: '',
      args: [],
    );
  }

  /// `To connect`
  String get dashboard1LargeButton {
    return Intl.message(
      'To connect',
      name: 'dashboard1LargeButton',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to view your measurements or change your settings? \n Click here.`
  String get dashboard1Title3 {
    return Intl.message(
      'Would you like to view your measurements or change your settings? \n Click here.',
      name: 'dashboard1Title3',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get navigationOption1 {
    return Intl.message(
      'Settings',
      name: 'navigationOption1',
      desc: '',
      args: [],
    );
  }

  /// `Audio settings`
  String get navigationOption2 {
    return Intl.message(
      'Audio settings',
      name: 'navigationOption2',
      desc: '',
      args: [],
    );
  }

  /// `mijn.biocheck.nl`
  String get navigationOption3 {
    return Intl.message(
      'mijn.biocheck.nl',
      name: 'navigationOption3',
      desc: '',
      args: [],
    );
  }

  /// `Knowledgebase`
  String get navigationOption4 {
    return Intl.message(
      'Knowledgebase',
      name: 'navigationOption4',
      desc: '',
      args: [],
    );
  }

  /// `Achievements`
  String get navigationOption5 {
    return Intl.message(
      'Achievements',
      name: 'navigationOption5',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get navigationOption6 {
    return Intl.message(
      'Log out',
      name: 'navigationOption6',
      desc: '',
      args: [],
    );
  }

  /// `Link`
  String get navigationOptionBottom1 {
    return Intl.message(
      'Link',
      name: 'navigationOptionBottom1',
      desc: '',
      args: [],
    );
  }

  /// `with heart rate belt`
  String get navigationOptionBottom2 {
    return Intl.message(
      'with heart rate belt',
      name: 'navigationOptionBottom2',
      desc: '',
      args: [],
    );
  }

  /// `Atechnician | BioCheck \n Design | Patrick van Luijk`
  String get navigationOptionBottom3 {
    return Intl.message(
      'Atechnician | BioCheck \n Design | Patrick van Luijk',
      name: 'navigationOptionBottom3',
      desc: '',
      args: [],
    );
  }

  /// `Free \n Zerocheck`
  String get dashboard2Zerocheck {
    return Intl.message(
      'Free \n Zerocheck',
      name: 'dashboard2Zerocheck',
      desc: '',
      args: [],
    );
  }

  /// `Fitness \n Protocol`
  String get dashboard2ProtocolOption {
    return Intl.message(
      'Fitness \n Protocol',
      name: 'dashboard2ProtocolOption',
      desc: '',
      args: [],
    );
  }

  /// `Free training`
  String get dashboard2FreeTrainingOption {
    return Intl.message(
      'Free training',
      name: 'dashboard2FreeTrainingOption',
      desc: '',
      args: [],
    );
  }

  /// `Free \n Measurement`
  String get dashboard2FreeMeasureOption {
    return Intl.message(
      'Free \n Measurement',
      name: 'dashboard2FreeMeasureOption',
      desc: '',
      args: [],
    );
  }

  /// `Personal schedules \n for competitions`
  String get dashboard2PersonalOption {
    return Intl.message(
      'Personal schedules \n for competitions',
      name: 'dashboard2PersonalOption',
      desc: '',
      args: [],
    );
  }

  /// `Personal \n feeding schedule`
  String get dashboard2InspirationOption {
    return Intl.message(
      'Personal \n feeding schedule',
      name: 'dashboard2InspirationOption',
      desc: '',
      args: [],
    );
  }

  /// `You haven't taken a rest measurement today`
  String get dashboard2MessageNoMeasurementYet {
    return Intl.message(
      'You haven\'t taken a rest measurement today',
      name: 'dashboard2MessageNoMeasurementYet',
      desc: '',
      args: [],
    );
  }

  /// `You are not connected to your heart rate belt and therefore cannot train or \n measure. Do you want to connect with your heart rate belt? Click here. `
  String get dashboard2MessageNoConnection {
    return Intl.message(
      'You are not connected to your heart rate belt and therefore cannot train or \n measure. Do you want to connect with your heart rate belt? Click here. ',
      name: 'dashboard2MessageNoConnection',
      desc: '',
      args: [],
    );
  }

  /// `Last AT tested`
  String get settingsLastTested {
    return Intl.message(
      'Last AT tested',
      name: 'settingsLastTested',
      desc: '',
      args: [],
    );
  }

  /// `Number of CVP trainings`
  String get settingsCVP {
    return Intl.message(
      'Number of CVP trainings',
      name: 'settingsCVP',
      desc: '',
      args: [],
    );
  }

  /// `You follow the BioCheck program:`
  String get settingsFollowed {
    return Intl.message(
      'You follow the BioCheck program:',
      name: 'settingsFollowed',
      desc: '',
      args: [],
    );
  }

  /// `Vitaliteit`
  String get Vitality {
    return Intl.message(
      'Vitaliteit',
      name: 'Vitality',
      desc: '',
      args: [],
    );
  }

  /// `Your account ends on:`
  String get settingsAccountEnd {
    return Intl.message(
      'Your account ends on:',
      name: 'settingsAccountEnd',
      desc: '',
      args: [],
    );
  }

  /// `ZeroCheck reminder`
  String get settingsZeroCheck {
    return Intl.message(
      'ZeroCheck reminder',
      name: 'settingsZeroCheck',
      desc: '',
      args: [],
    );
  }

  /// `Click here to set a reminder`
  String get settingsZeroCheckTitle {
    return Intl.message(
      'Click here to set a reminder',
      name: 'settingsZeroCheckTitle',
      desc: '',
      args: [],
    );
  }

  /// `So you don't skip a morning measurement. You can set the time and every day you will be reminded to take a measurement.`
  String get settingsZeroCheckDescription {
    return Intl.message(
      'So you don\'t skip a morning measurement. You can set the time and every day you will be reminded to take a measurement.',
      name: 'settingsZeroCheckDescription',
      desc: '',
      args: [],
    );
  }

  /// `Breathing exercises reminder`
  String get settingsBreathing {
    return Intl.message(
      'Breathing exercises reminder',
      name: 'settingsBreathing',
      desc: '',
      args: [],
    );
  }

  /// `Click here to set a reminder`
  String get settingsBreathingTitle {
    return Intl.message(
      'Click here to set a reminder',
      name: 'settingsBreathingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Every 50 minutes you will receive a notification for correct breathing. You will notice that you have incorrect breathing more often than you think.`
  String get settingsBreathingDescription {
    return Intl.message(
      'Every 50 minutes you will receive a notification for correct breathing. You will notice that you have incorrect breathing more often than you think.',
      name: 'settingsBreathingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsLanguage {
    return Intl.message(
      'Language',
      name: 'settingsLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Click here to set the language of the app`
  String get settingsLanguageTitleLink {
    return Intl.message(
      'Click here to set the language of the app',
      name: 'settingsLanguageTitleLink',
      desc: '',
      args: [],
    );
  }

  /// `Both text and audio accompaniment are adjusted according to the chosen language.`
  String get settingsLanguageDesc {
    return Intl.message(
      'Both text and audio accompaniment are adjusted according to the chosen language.',
      name: 'settingsLanguageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Upload only with WiFi`
  String get settingsUploadToggle {
    return Intl.message(
      'Upload only with WiFi',
      name: 'settingsUploadToggle',
      desc: '',
      args: [],
    );
  }

  /// `Turn this on if you are abroad, for example, to save roaming costs.`
  String get settingsUploadToggleDescription {
    return Intl.message(
      'Turn this on if you are abroad, for example, to save roaming costs.',
      name: 'settingsUploadToggleDescription',
      desc: '',
      args: [],
    );
  }

  /// `Audio on / off`
  String get audioSettingsOnOff {
    return Intl.message(
      'Audio on / off',
      name: 'audioSettingsOnOff',
      desc: '',
      args: [],
    );
  }

  /// `Turn this on if you want the audio guidance during training or measuring.`
  String get audioSettingsGuidance {
    return Intl.message(
      'Turn this on if you want the audio guidance during training or measuring.',
      name: 'audioSettingsGuidance',
      desc: '',
      args: [],
    );
  }

  /// `Interval of audio`
  String get audioSettingsInterval {
    return Intl.message(
      'Interval of audio',
      name: 'audioSettingsInterval',
      desc: '',
      args: [],
    );
  }

  /// `Click here to determine the interval time`
  String get audioSettingsClickHere1 {
    return Intl.message(
      'Click here to determine the interval time',
      name: 'audioSettingsClickHere1',
      desc: '',
      args: [],
    );
  }

  /// `Change of zone`
  String get audioSettingsZoneChange {
    return Intl.message(
      'Change of zone',
      name: 'audioSettingsZoneChange',
      desc: '',
      args: [],
    );
  }

  /// `Turn this on if you want to hear if you have changed zones in the meantime.`
  String get audioSettingsZoneChangeHear {
    return Intl.message(
      'Turn this on if you want to hear if you have changed zones in the meantime.',
      name: 'audioSettingsZoneChangeHear',
      desc: '',
      args: [],
    );
  }

  /// `Information during training`
  String get audioSettingsInfoDuring {
    return Intl.message(
      'Information during training',
      name: 'audioSettingsInfoDuring',
      desc: '',
      args: [],
    );
  }

  /// `Here you can select which information you want to hear during your training.`
  String get audioSettingsInfoTypeSelect {
    return Intl.message(
      'Here you can select which information you want to hear during your training.',
      name: 'audioSettingsInfoTypeSelect',
      desc: '',
      args: [],
    );
  }

  /// `Zone`
  String get audioSettingsZone {
    return Intl.message(
      'Zone',
      name: 'audioSettingsZone',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get audioSettingsTime {
    return Intl.message(
      'Time',
      name: 'audioSettingsTime',
      desc: '',
      args: [],
    );
  }

  /// `Heartbeat`
  String get audioSettingsHeartbeat {
    return Intl.message(
      'Heartbeat',
      name: 'audioSettingsHeartbeat',
      desc: '',
      args: [],
    );
  }

  /// `Speed`
  String get audioSettingsSpeed {
    return Intl.message(
      'Speed',
      name: 'audioSettingsSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get audioSettingsDistance {
    return Intl.message(
      'Distance',
      name: 'audioSettingsDistance',
      desc: '',
      args: [],
    );
  }

  /// `Interval of audio for AT test`
  String get audioSettingsIntervalAT {
    return Intl.message(
      'Interval of audio for AT test',
      name: 'audioSettingsIntervalAT',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'audioSettingsText to speech' key

  /// `Click here to open the text to speech settings.`
  String get audioSettingsClickToOpenSpeech {
    return Intl.message(
      'Click here to open the text to speech settings.',
      name: 'audioSettingsClickToOpenSpeech',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get Filter {
    return Intl.message(
      'Filter',
      name: 'Filter',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get History {
    return Intl.message(
      'History',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `You did your best and that should be rewarded! Below you can see all the achievements you have achieved.`
  String get achievementTitle {
    return Intl.message(
      'You did your best and that should be rewarded! Below you can see all the achievements you have achieved.',
      name: 'achievementTitle',
      desc: '',
      args: [],
    );
  }

  /// `\nStep 2 \nSelect \nyour heart rate belt`
  String get selectBeltTitle {
    return Intl.message(
      '\nStep 2 \nSelect \nyour heart rate belt',
      name: 'selectBeltTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name your heart rate belt. This way you can find it more easily if there are more heart rate belts in your area.`
  String get setBeltPopupTitle {
    return Intl.message(
      'Name your heart rate belt. This way you can find it more easily if there are more heart rate belts in your area.',
      name: 'setBeltPopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Step 3 \nConfigure`
  String get configurationTitle {
    return Intl.message(
      'Step 3 \nConfigure',
      name: 'configurationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Step 4 \nYou are connected to your heart rate belt`
  String get configurationSuccessTitle {
    return Intl.message(
      'Step 4 \nYou are connected to your heart rate belt',
      name: 'configurationSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade your package`
  String get upgradeTitle {
    return Intl.message(
      'Upgrade your package',
      name: 'upgradeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sorry! You do not have access to this option. \nIf you want to use this too, please \n contact your supervisor for the \n options or look for a BioCheck \n in your`
  String get upgradeDescription {
    return Intl.message(
      'Sorry! You do not have access to this option. \nIf you want to use this too, please \n contact your supervisor for the \n options or look for a BioCheck \n in your',
      name: 'upgradeDescription',
      desc: '',
      args: [],
    );
  }

  /// `The waiting room \n`
  String get waitingRoomPopupTitle {
    return Intl.message(
      'The waiting room \n',
      name: 'waitingRoomPopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Did you know that ... As contradictory as it may seem, but movement is a very good therapy for severe, persistent fatigue? With this complaint you will generally find \n increased combustion at rest. \nSimply put: with movement you \n adjust the level of exertion to \nthe already existing increased combustion \n. \n`
  String get waitingRoomPopupDesc {
    return Intl.message(
      'Did you know that ... As contradictory as it may seem, but movement is a very good therapy for severe, persistent fatigue? With this complaint you will generally find \n increased combustion at rest. \nSimply put: with movement you \n adjust the level of exertion to \nthe already existing increased combustion \n. \n',
      name: 'waitingRoomPopupDesc',
      desc: '',
      args: [],
    );
  }

  /// `Calibrate`
  String get waitingRoomPopupBtn1 {
    return Intl.message(
      'Calibrate',
      name: 'waitingRoomPopupBtn1',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I have read it`
  String get waitingRoomPopupBtn2 {
    return Intl.message(
      'Yes, I have read it',
      name: 'waitingRoomPopupBtn2',
      desc: '',
      args: [],
    );
  }

  /// `R U S T M E T I N G`
  String get measuring {
    return Intl.message(
      'R U S T M E T I N G',
      name: 'measuring',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get timeTitle {
    return Intl.message(
      'Time',
      name: 'timeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Heartbeat`
  String get heartbeatTitle {
    return Intl.message(
      'Heartbeat',
      name: 'heartbeatTitle',
      desc: '',
      args: [],
    );
  }

  /// `Amplitude`
  String get ampTitle {
    return Intl.message(
      'Amplitude',
      name: 'ampTitle',
      desc: '',
      args: [],
    );
  }

  /// `Low stress`
  String get lgstrsTitle {
    return Intl.message(
      'Low stress',
      name: 'lgstrsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Relax`
  String get relaxTitle {
    return Intl.message(
      'Relax',
      name: 'relaxTitle',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get normalTitle {
    return Intl.message(
      'Normal',
      name: 'normalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Low stress`
  String get stress1Title {
    return Intl.message(
      'Low stress',
      name: 'stress1Title',
      desc: '',
      args: [],
    );
  }

  /// `Heavy stress`
  String get stress2Title {
    return Intl.message(
      'Heavy stress',
      name: 'stress2Title',
      desc: '',
      args: [],
    );
  }

  /// `Average values`
  String get valuesTitle {
    return Intl.message(
      'Average values',
      name: 'valuesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Breath freq.`
  String get BreathfreqTitle {
    return Intl.message(
      'Breath freq.',
      name: 'BreathfreqTitle',
      desc: '',
      args: [],
    );
  }

  /// `Compared to previous days, your ability to recover is today.`
  String get abilityToRecover {
    return Intl.message(
      'Compared to previous days, your ability to recover is today.',
      name: 'abilityToRecover',
      desc: '',
      args: [],
    );
  }

  /// `Mediocre`
  String get mediocreTitle {
    return Intl.message(
      'Mediocre',
      name: 'mediocreTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mentally`
  String get mentallyTitle {
    return Intl.message(
      'Mentally',
      name: 'mentallyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Physical`
  String get physicalTitle {
    return Intl.message(
      'Physical',
      name: 'physicalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sleep`
  String get sleepTitle {
    return Intl.message(
      'Sleep',
      name: 'sleepTitle',
      desc: '',
      args: [],
    );
  }

  /// `muscle strain`
  String get muscleTitle {
    return Intl.message(
      'muscle strain',
      name: 'muscleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Question y`
  String get qYTitle {
    return Intl.message(
      'Question y',
      name: 'qYTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notities {
    return Intl.message(
      'Notes',
      name: 'notities',
      desc: '',
      args: [],
    );
  }

  /// `Write notes here`
  String get notitieshint {
    return Intl.message(
      'Write notes here',
      name: 'notitieshint',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out?`
  String get logoutTitle {
    return Intl.message(
      'Do you want to log out?',
      name: 'logoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Measurement error`
  String get connectTitle {
    return Intl.message(
      'Measurement error',
      name: 'connectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Restarting`
  String get restartTitle {
    return Intl.message(
      'Restarting',
      name: 'restartTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get on`
  String get getOnTitle {
    return Intl.message(
      'Get on',
      name: 'getOnTitle',
      desc: '',
      args: [],
    );
  }

  /// `Oops! We signal that something is not going well during this measurement. \n \nCheck whether your heart rate belt is properly fitted, there is gel on the belt or your bluetooth connection is on. When the measuring points come in correctly, you can click continue .. \n`
  String get connectDesc {
    return Intl.message(
      'Oops! We signal that something is not going well during this measurement. \n \nCheck whether your heart rate belt is properly fitted, there is gel on the belt or your bluetooth connection is on. When the measuring points come in correctly, you can click continue .. \n',
      name: 'connectDesc',
      desc: '',
      args: [],
    );
  }

  /// `Here you can write notes about your training \n \nHow you feel after training or just before training. What training you did if you did a free practice. \n \nPain complaints etc.`
  String get notitiesDes {
    return Intl.message(
      'Here you can write notes about your training \n \nHow you feel after training or just before training. What training you did if you did a free practice. \n \nPain complaints etc.',
      name: 'notitiesDes',
      desc: '',
      args: [],
    );
  }

  /// `Eating sugars makes you tired`
  String get upCurveTitle {
    return Intl.message(
      'Eating sugars makes you tired',
      name: 'upCurveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Good behaviour`
  String get downCurveTitle {
    return Intl.message(
      'Good behaviour',
      name: 'downCurveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Like a mirror in your pocket`
  String get searchPopupTitle {
    return Intl.message(
      'Like a mirror in your pocket',
      name: 'searchPopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you recover in your sleep?`
  String get sleepPopupTitle {
    return Intl.message(
      'Do you recover in your sleep?',
      name: 'sleepPopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Achievements`
  String get achievementsTitle {
    return Intl.message(
      'Achievements',
      name: 'achievementsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Teach friends how it works`
  String get teachFrndsTitle {
    return Intl.message(
      'Teach friends how it works',
      name: 'teachFrndsTitle',
      desc: '',
      args: [],
    );
  }

  /// `83% of people who are committed to the program and therefore to themselves return to work within 12 weeks. \n \nThose who do not follow the program well need a longer time before they follow themselves better. `
  String get upCurveDes {
    return Intl.message(
      '83% of people who are committed to the program and therefore to themselves return to work within 12 weeks. \n \nThose who do not follow the program well need a longer time before they follow themselves better. ',
      name: 'upCurveDes',
      desc: '',
      args: [],
    );
  }

  /// `Good breathing contributes to activating your fat burning at rest. This helps you to relax and recover better. \n \n If you eat food that contains a lot of sugars / carbohydrates, you stimulate your sugar burning. \n \n Work so hard on your breathing for nothing! \n \n If you are hungry, choose nuts, carrots, avocado, tomatoes or cucumber for example. \n`
  String get downCurveDes {
    return Intl.message(
      'Good breathing contributes to activating your fat burning at rest. This helps you to relax and recover better. \n \n If you eat food that contains a lot of sugars / carbohydrates, you stimulate your sugar burning. \n \n Work so hard on your breathing for nothing! \n \n If you are hungry, choose nuts, carrots, avocado, tomatoes or cucumber for example. \n',
      name: 'downCurveDes',
      desc: '',
      args: [],
    );
  }

  /// `With this app you can see how active you are during a 'heavy' conversation or presentation or when you are 'just' sitting behind your laptop! And also how long it takes to recover from that. \n \n Are you curious about this? Then put on your belt, press the 'free measurement' button and put your phone in your pocket and then measure your values ​​for hours and get insight into what costs and gives you energy! \n`
  String get searchPopupDes {
    return Intl.message(
      'With this app you can see how active you are during a \'heavy\' conversation or presentation or when you are \'just\' sitting behind your laptop! And also how long it takes to recover from that. \n \n Are you curious about this? Then put on your belt, press the \'free measurement\' button and put your phone in your pocket and then measure your values ​​for hours and get insight into what costs and gives you energy! \n',
      name: 'searchPopupDes',
      desc: '',
      args: [],
    );
  }

  /// `You can now measure how your recovery is going in your sleep. Do you often wake up tired and wonder how active you are in your sleep? Then put on the strap and press the 'free measurement' button and measure throughout the night. \n \n Then log into your online dashboard to see how wild your night was! \n`
  String get sleepPopupDes {
    return Intl.message(
      'You can now measure how your recovery is going in your sleep. Do you often wake up tired and wonder how active you are in your sleep? Then put on the strap and press the \'free measurement\' button and measure throughout the night. \n \n Then log into your online dashboard to see how wild your night was! \n',
      name: 'sleepPopupDes',
      desc: '',
      args: [],
    );
  }

  /// `Did you know there are achievements hiding in this app that you can unlock simply by working on your recovery? You should have seen the first achievements already:) \n \nThe achievements are not made based on achievements, but based on commitment and recovery. \n`
  String get achievementsDes {
    return Intl.message(
      'Did you know there are achievements hiding in this app that you can unlock simply by working on your recovery? You should have seen the first achievements already:) \n \nThe achievements are not made based on achievements, but based on commitment and recovery. \n',
      name: 'achievementsDes',
      desc: '',
      args: [],
    );
  }

  /// `Go through the knowledge base and get a better understanding of how stress works physiologically and how it affects your ability to recover. \n \nPlease share that with the people around you, so that they also better understand what is happening to you.`
  String get teachFrndsDes {
    return Intl.message(
      'Go through the knowledge base and get a better understanding of how stress works physiologically and how it affects your ability to recover. \n \nPlease share that with the people around you, so that they also better understand what is happening to you.',
      name: 'teachFrndsDes',
      desc: '',
      args: [],
    );
  }

  /// `Kies je sport`
  String get selYrSport {
    return Intl.message(
      'Kies je sport',
      name: 'selYrSport',
      desc: '',
      args: [],
    );
  }

  /// `Choose your training level`
  String get selYrTrainingLevel {
    return Intl.message(
      'Choose your training level',
      name: 'selYrTrainingLevel',
      desc: '',
      args: [],
    );
  }

  /// `Training based on the turning point \nfrom the exercise test: 174`
  String get selYrSportOpt1 {
    return Intl.message(
      'Training based on the turning point \nfrom the exercise test: 174',
      name: 'selYrSportOpt1',
      desc: '',
      args: [],
    );
  }

  /// `Select this option if you have not done \nan effort test.`
  String get selYrSportOpt2 {
    return Intl.message(
      'Select this option if you have not done \nan effort test.',
      name: 'selYrSportOpt2',
      desc: '',
      args: [],
    );
  }

  /// `Time in zone:`
  String get timeInZone {
    return Intl.message(
      'Time in zone:',
      name: 'timeInZone',
      desc: '',
      args: [],
    );
  }

  /// `Training time:`
  String get timeTrain {
    return Intl.message(
      'Training time:',
      name: 'timeTrain',
      desc: '',
      args: [],
    );
  }

  /// `This is perfect! \n`
  String get perfect {
    return Intl.message(
      'This is perfect! \n',
      name: 'perfect',
      desc: '',
      args: [],
    );
  }

  /// `Endurance 2`
  String get Endurance {
    return Intl.message(
      'Endurance 2',
      name: 'Endurance',
      desc: '',
      args: [],
    );
  }

  /// `Your training is \ncompleted`
  String get trainingAcc {
    return Intl.message(
      'Your training is \ncompleted',
      name: 'trainingAcc',
      desc: '',
      args: [],
    );
  }

  /// `Your training has \nbeen canceled`
  String get trainingCan {
    return Intl.message(
      'Your training has \nbeen canceled',
      name: 'trainingCan',
      desc: '',
      args: [],
    );
  }

  /// `Highest heart rate`
  String get heighHeart {
    return Intl.message(
      'Highest heart rate',
      name: 'heighHeart',
      desc: '',
      args: [],
    );
  }

  /// `Lowest heart rate`
  String get lowHeart {
    return Intl.message(
      'Lowest heart rate',
      name: 'lowHeart',
      desc: '',
      args: [],
    );
  }

  /// `Click the check mark to see your results`
  String get clickCheck {
    return Intl.message(
      'Click the check mark to see your results',
      name: 'clickCheck',
      desc: '',
      args: [],
    );
  }

  /// `Click on the cross to see your results`
  String get clickCross {
    return Intl.message(
      'Click on the cross to see your results',
      name: 'clickCross',
      desc: '',
      args: [],
    );
  }

  /// `Go pro at your level!`
  String get goProTitle {
    return Intl.message(
      'Go pro at your level!',
      name: 'goProTitle',
      desc: '',
      args: [],
    );
  }

  /// `Marathon schedule`
  String get marthSchema {
    return Intl.message(
      'Marathon schedule',
      name: 'marthSchema',
      desc: '',
      args: [],
    );
  }

  /// `Half marathon schedule`
  String get halfMarthSchema {
    return Intl.message(
      'Half marathon schedule',
      name: 'halfMarthSchema',
      desc: '',
      args: [],
    );
  }

  /// `10 km schedule`
  String get schema10 {
    return Intl.message(
      '10 km schedule',
      name: 'schema10',
      desc: '',
      args: [],
    );
  }

  /// `Remaining km:`
  String get remaining {
    return Intl.message(
      'Remaining km:',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Time below target heart rate`
  String get proes1 {
    return Intl.message(
      'Time below target heart rate',
      name: 'proes1',
      desc: '',
      args: [],
    );
  }

  /// `Time on target heart rate`
  String get proes2 {
    return Intl.message(
      'Time on target heart rate',
      name: 'proes2',
      desc: '',
      args: [],
    );
  }

  /// `Time above target heart rate`
  String get proes3 {
    return Intl.message(
      'Time above target heart rate',
      name: 'proes3',
      desc: '',
      args: [],
    );
  }

  /// `www.biocheck.nl/locaties`
  String get upgradeLink {
    return Intl.message(
      'www.biocheck.nl/locaties',
      name: 'upgradeLink',
      desc: '',
      args: [],
    );
  }

  /// `neighborhood`
  String get upgradeLinkStart {
    return Intl.message(
      'neighborhood',
      name: 'upgradeLinkStart',
      desc: '',
      args: [],
    );
  }

  /// `Rest measurement`
  String get measuring1 {
    return Intl.message(
      'Rest measurement',
      name: 'measuring1',
      desc: '',
      args: [],
    );
  }

  /// `To follow the Chronic Fatigue Protocol, \nit is necessary to do a ZeroCheck first. Click on the \nheart at the bottom of the screen to start \nthe resting measurement.`
  String get measuring1Desc {
    return Intl.message(
      'To follow the Chronic Fatigue Protocol, \nit is necessary to do a ZeroCheck first. Click on the \nheart at the bottom of the screen to start \nthe resting measurement.',
      name: 'measuring1Desc',
      desc: '',
      args: [],
    );
  }

  /// `Here you can write other notes. \n \nFor example, you can write down what activities you did yesterday. \n \nThis will give you a good insight into your well-being over a longer period of time.`
  String get notitie_heart_beat {
    return Intl.message(
      'Here you can write other notes. \n \nFor example, you can write down what activities you did yesterday. \n \nThis will give you a good insight into your well-being over a longer period of time.',
      name: 'notitie_heart_beat',
      desc: '',
      args: [],
    );
  }

  /// `Bicycles`
  String get CVPOPTBicycles {
    return Intl.message(
      'Bicycles',
      name: 'CVPOPTBicycles',
      desc: '',
      args: [],
    );
  }

  /// `Running`
  String get CVPOPTRunning {
    return Intl.message(
      'Running',
      name: 'CVPOPTRunning',
      desc: '',
      args: [],
    );
  }

  /// `To walk`
  String get CVPOPTToWalk {
    return Intl.message(
      'To walk',
      name: 'CVPOPTToWalk',
      desc: '',
      args: [],
    );
  }

  /// `Rowing`
  String get CVPOPTRowing {
    return Intl.message(
      'Rowing',
      name: 'CVPOPTRowing',
      desc: '',
      args: [],
    );
  }

  /// `Ice skating`
  String get CVPOPTIceskating {
    return Intl.message(
      'Ice skating',
      name: 'CVPOPTIceskating',
      desc: '',
      args: [],
    );
  }

  /// `Cross trainer`
  String get CVPOPTCrossTrainer {
    return Intl.message(
      'Cross trainer',
      name: 'CVPOPTCrossTrainer',
      desc: '',
      args: [],
    );
  }

  /// `Your schedule for today`
  String get ScheduleToday {
    return Intl.message(
      'Your schedule for today',
      name: 'ScheduleToday',
      desc: '',
      args: [],
    );
  }

  /// `What are you going to measure?`
  String get MeasureToday {
    return Intl.message(
      'What are you going to measure?',
      name: 'MeasureToday',
      desc: '',
      args: [],
    );
  }

  /// `Sleep`
  String get FTSleep {
    return Intl.message(
      'Sleep',
      name: 'FTSleep',
      desc: '',
      args: [],
    );
  }

  /// `Relaxation`
  String get FTRelaxation {
    return Intl.message(
      'Relaxation',
      name: 'FTRelaxation',
      desc: '',
      args: [],
    );
  }

  /// `Driving`
  String get FTDriving {
    return Intl.message(
      'Driving',
      name: 'FTDriving',
      desc: '',
      args: [],
    );
  }

  /// `Having a conversation with the coach`
  String get FTConversation {
    return Intl.message(
      'Having a conversation with the coach',
      name: 'FTConversation',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get FTWork {
    return Intl.message(
      'Work',
      name: 'FTWork',
      desc: '',
      args: [],
    );
  }

  /// `Different`
  String get FTDiff {
    return Intl.message(
      'Different',
      name: 'FTDiff',
      desc: '',
      args: [],
    );
  }

  /// `FREE METNIG`
  String get FreeMeasure {
    return Intl.message(
      'FREE METNIG',
      name: 'FreeMeasure',
      desc: '',
      args: [],
    );
  }

  /// `The crown`
  String get Achievement1Title {
    return Intl.message(
      'The crown',
      name: 'Achievement1Title',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have completed the Chronic Fatigue Protocol of 54 workouts!`
  String get Achievement1Desc {
    return Intl.message(
      'Congratulations! You have completed the Chronic Fatigue Protocol of 54 workouts!',
      name: 'Achievement1Desc',
      desc: '',
      args: [],
    );
  }

  /// `90+`
  String get Achievement2Title {
    return Intl.message(
      '90+',
      name: 'Achievement2Title',
      desc: '',
      args: [],
    );
  }

  /// `Hhe managed to have an amplitude of more than 90 for more than 3 days!`
  String get Achievement2Desc {
    return Intl.message(
      'Hhe managed to have an amplitude of more than 90 for more than 3 days!',
      name: 'Achievement2Desc',
      desc: '',
      args: [],
    );
  }

  /// `1 hour +`
  String get Achievement3Title {
    return Intl.message(
      '1 hour +',
      name: 'Achievement3Title',
      desc: '',
      args: [],
    );
  }

  /// `Cool! You have taken a rest measurement for more than an hour to see how you recover during the day.`
  String get Achievement3Desc {
    return Intl.message(
      'Cool! You have taken a rest measurement for more than an hour to see how you recover during the day.',
      name: 'Achievement3Desc',
      desc: '',
      args: [],
    );
  }

  /// `In balance`
  String get Achievement4Title {
    return Intl.message(
      'In balance',
      name: 'Achievement4Title',
      desc: '',
      args: [],
    );
  }

  /// `Super! You have started the vitality program to stay in balance.`
  String get Achievement4Desc {
    return Intl.message(
      'Super! You have started the vitality program to stay in balance.',
      name: 'Achievement4Desc',
      desc: '',
      args: [],
    );
  }

  /// `90+`
  String get Achievement5Title {
    return Intl.message(
      '90+',
      name: 'Achievement5Title',
      desc: '',
      args: [],
    );
  }

  /// `You managed to have an amplitude above 90 for more than 7 days!`
  String get Achievement5Desc {
    return Intl.message(
      'You managed to have an amplitude above 90 for more than 7 days!',
      name: 'Achievement5Desc',
      desc: '',
      args: [],
    );
  }

  /// `Christmas`
  String get Achievement6Title {
    return Intl.message(
      'Christmas',
      name: 'Achievement6Title',
      desc: '',
      args: [],
    );
  }

  /// `The holidays are stressful enough! Nice training to handle the family;)`
  String get Achievement6Desc {
    return Intl.message(
      'The holidays are stressful enough! Nice training to handle the family;)',
      name: 'Achievement6Desc',
      desc: '',
      args: [],
    );
  }

  /// `1st measurement`
  String get Achievement7Title {
    return Intl.message(
      '1st measurement',
      name: 'Achievement7Title',
      desc: '',
      args: [],
    );
  }

  /// `Great, you have taken your first measurement and this gives you insight into your load capacity.`
  String get Achievement7Desc {
    return Intl.message(
      'Great, you have taken your first measurement and this gives you insight into your load capacity.',
      name: 'Achievement7Desc',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get Achievement8Title {
    return Intl.message(
      'Start',
      name: 'Achievement8Title',
      desc: '',
      args: [],
    );
  }

  /// `A decision is nothing more than a start! You will learn how you can use breathing and movement for recovery.`
  String get Achievement8Desc {
    return Intl.message(
      'A decision is nothing more than a start! You will learn how you can use breathing and movement for recovery.',
      name: 'Achievement8Desc',
      desc: '',
      args: [],
    );
  }

  /// `Block 2`
  String get Achievement9Title {
    return Intl.message(
      'Block 2',
      name: 'Achievement9Title',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have completed the second training block of 18 training sessions.`
  String get Achievement9Desc {
    return Intl.message(
      'Congratulations! You have completed the second training block of 18 training sessions.',
      name: 'Achievement9Desc',
      desc: '',
      args: [],
    );
  }

  /// `All inclusive`
  String get Achievement10Title {
    return Intl.message(
      'All inclusive',
      name: 'Achievement10Title',
      desc: '',
      args: [],
    );
  }

  /// `All inclusive pass. \nYou have all the features of the app at your disposal!`
  String get Achievement10Desc {
    return Intl.message(
      'All inclusive pass. \nYou have all the features of the app at your disposal!',
      name: 'Achievement10Desc',
      desc: '',
      args: [],
    );
  }

  /// `Played out`
  String get Achievement11Title {
    return Intl.message(
      'Played out',
      name: 'Achievement11Title',
      desc: '',
      args: [],
    );
  }

  /// `Boss. \nYou have completed all 108 workouts. Did you think you could be so fit?`
  String get Achievement11Desc {
    return Intl.message(
      'Boss. \nYou have completed all 108 workouts. Did you think you could be so fit?',
      name: 'Achievement11Desc',
      desc: '',
      args: [],
    );
  }

  /// `1 week`
  String get Achievement12Title {
    return Intl.message(
      '1 week',
      name: 'Achievement12Title',
      desc: '',
      args: [],
    );
  }

  /// `Great, you took a measurement every day this week. Keep it up!`
  String get Achievement12Desc {
    return Intl.message(
      'Great, you took a measurement every day this week. Keep it up!',
      name: 'Achievement12Desc',
      desc: '',
      args: [],
    );
  }

  /// `1 month`
  String get Achievement13Title {
    return Intl.message(
      '1 month',
      name: 'Achievement13Title',
      desc: '',
      args: [],
    );
  }

  /// `You are unstoppable! \nYou took a measurement every day this month!`
  String get Achievement13Desc {
    return Intl.message(
      'You are unstoppable! \nYou took a measurement every day this month!',
      name: 'Achievement13Desc',
      desc: '',
      args: [],
    );
  }

  /// `Very strong`
  String get Achievement14Title {
    return Intl.message(
      'Very strong',
      name: 'Achievement14Title',
      desc: '',
      args: [],
    );
  }

  /// `It is very difficult to take a rest measurement every day during the CVP, but you did it soldier!`
  String get Achievement14Desc {
    return Intl.message(
      'It is very difficult to take a rest measurement every day during the CVP, but you did it soldier!',
      name: 'Achievement14Desc',
      desc: '',
      args: [],
    );
  }

  /// `The world`
  String get Achievement15Title {
    return Intl.message(
      'The world',
      name: 'Achievement15Title',
      desc: '',
      args: [],
    );
  }

  /// `Take a measurement every day for 1 year. \nYou can take on the world! If you really want it.`
  String get Achievement15Desc {
    return Intl.message(
      'Take a measurement every day for 1 year. \nYou can take on the world! If you really want it.',
      name: 'Achievement15Desc',
      desc: '',
      args: [],
    );
  }

  /// `Block 1`
  String get Achievement16Title {
    return Intl.message(
      'Block 1',
      name: 'Achievement16Title',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations you have completed the first training block of 18 workouts!`
  String get Achievement16Desc {
    return Intl.message(
      'Congratulations you have completed the first training block of 18 workouts!',
      name: 'Achievement16Desc',
      desc: '',
      args: [],
    );
  }

  /// `You haven't taken a rest measurement today`
  String get HeartIconText {
    return Intl.message(
      'You haven\'t taken a rest measurement today',
      name: 'HeartIconText',
      desc: '',
      args: [],
    );
  }

  /// `How do you feel mentally?`
  String get QNT1 {
    return Intl.message(
      'How do you feel mentally?',
      name: 'QNT1',
      desc: '',
      args: [],
    );
  }

  /// `How do you feel physically?`
  String get QNT2 {
    return Intl.message(
      'How do you feel physically?',
      name: 'QNT2',
      desc: '',
      args: [],
    );
  }

  /// `How did you sleep?`
  String get QNT3 {
    return Intl.message(
      'How did you sleep?',
      name: 'QNT3',
      desc: '',
      args: [],
    );
  }

  /// `Do you have muscle pain?`
  String get QNT4 {
    return Intl.message(
      'Do you have muscle pain?',
      name: 'QNT4',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get ErrorRequired {
    return Intl.message(
      'This field is required',
      name: 'ErrorRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email format is not valid`
  String get ErrorEmailInvalid {
    return Intl.message(
      'Email format is not valid',
      name: 'ErrorEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password length should be between 6 to 15`
  String get ErrorPasswordLength {
    return Intl.message(
      'Password length should be between 6 to 15',
      name: 'ErrorPasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid establishment`
  String get ErrorFranchise {
    return Intl.message(
      'Please enter a valid establishment',
      name: 'ErrorFranchise',
      desc: '',
      args: [],
    );
  }

  /// `Send debug data`
  String get SendDebug {
    return Intl.message(
      'Send debug data',
      name: 'SendDebug',
      desc: '',
      args: [],
    );
  }

  /// `Click here to send a debug file`
  String get SendDebugValue {
    return Intl.message(
      'Click here to send a debug file',
      name: 'SendDebugValue',
      desc: '',
      args: [],
    );
  }

  /// `Only send a debug file if requested by the developer or your supervisor.`
  String get SendDebugDesc {
    return Intl.message(
      'Only send a debug file if requested by the developer or your supervisor.',
      name: 'SendDebugDesc',
      desc: '',
      args: [],
    );
  }

  /// `New update available!`
  String get UpdatePopupTitle {
    return Intl.message(
      'New update available!',
      name: 'UpdatePopupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Press the green button to start \ndownloading.\n`
  String get UpdatePopupSubTitle {
    return Intl.message(
      'Press the green button to start \ndownloading.\n',
      name: 'UpdatePopupSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Now`
  String get UpdatePopupYes {
    return Intl.message(
      'Now',
      name: 'UpdatePopupYes',
      desc: '',
      args: [],
    );
  }

  /// `Not now`
  String get UpdatePopupNo {
    return Intl.message(
      'Not now',
      name: 'UpdatePopupNo',
      desc: '',
      args: [],
    );
  }

  /// `What's new in this update?`
  String get UpdatePopupSuccess {
    return Intl.message(
      'What\'s new in this update?',
      name: 'UpdatePopupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Healthy people`
  String get KB1Title {
    return Intl.message(
      'Healthy people',
      name: 'KB1Title',
      desc: '',
      args: [],
    );
  }

  /// `Recovery system`
  String get KB2Title {
    return Intl.message(
      'Recovery system',
      name: 'KB2Title',
      desc: '',
      args: [],
    );
  }

  /// `Not enough rest`
  String get KB3Title {
    return Intl.message(
      'Not enough rest',
      name: 'KB3Title',
      desc: '',
      args: [],
    );
  }

  /// `Healthy people at rest get energy through fat burning. People with burnout, Chronic Fatigue Syndrome (CFS), glandular fever, fibromyalgia and Myalgic Encephalomyelitis (ME) primarily use their sugar stores at rest, which are normally intended for exercise. The body of chronically fatigued patients appears to be in a continuous active state, preventing them from recovering.`
  String get KB1Desc {
    return Intl.message(
      'Healthy people at rest get energy through fat burning. People with burnout, Chronic Fatigue Syndrome (CFS), glandular fever, fibromyalgia and Myalgic Encephalomyelitis (ME) primarily use their sugar stores at rest, which are normally intended for exercise. The body of chronically fatigued patients appears to be in a continuous active state, preventing them from recovering.',
      name: 'KB1Desc',
      desc: '',
      args: [],
    );
  }

  /// `It takes 48 hours for the body's recovery system to get back to normal after a major effort. In fact, the body makes itself just that little bit better than last time to be even better prepared when something tough has to be overcome again. This process is called super compensation.`
  String get KB2Desc {
    return Intl.message(
      'It takes 48 hours for the body\'s recovery system to get back to normal after a major effort. In fact, the body makes itself just that little bit better than last time to be even better prepared when something tough has to be overcome again. This process is called super compensation.',
      name: 'KB2Desc',
      desc: '',
      args: [],
    );
  }

  /// `When we don't get enough rest and keep exhausting our bodies, we get worse and worse. This happens, for example, if you demand too much from your body on a daily basis or if you cannot get your rest. The stocks are no longer replenished to the maximum and if you keep that up long enough, it leads to exhaustion. In sports this is called overtraining, in normal life being overwrought or burned out.`
  String get KB3Desc {
    return Intl.message(
      'When we don\'t get enough rest and keep exhausting our bodies, we get worse and worse. This happens, for example, if you demand too much from your body on a daily basis or if you cannot get your rest. The stocks are no longer replenished to the maximum and if you keep that up long enough, it leads to exhaustion. In sports this is called overtraining, in normal life being overwrought or burned out.',
      name: 'KB3Desc',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get DarkModeTitle {
    return Intl.message(
      'Dark mode',
      name: 'DarkModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Turn this on to create more rest for your eyes in the dark`
  String get DarkModeDesc {
    return Intl.message(
      'Turn this on to create more rest for your eyes in the dark',
      name: 'DarkModeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Focus mode`
  String get FocusModeTitle {
    return Intl.message(
      'Focus mode',
      name: 'FocusModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Turn this on to block all notifications from apps while using this app.`
  String get FocusModeDesc {
    return Intl.message(
      'Turn this on to block all notifications from apps while using this app.',
      name: 'FocusModeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Hi, welcome to BioCheck. I am Eva and from time to time you will hear me pass on your results, guide you during your training or help motivate with your measurements. If you have any questions about the app or how to use it, please contact your supervisor. Thank you for your confidence`
  String get FirstTimeLogin {
    return Intl.message(
      'Hi, welcome to BioCheck. I am Eva and from time to time you will hear me pass on your results, guide you during your training or help motivate with your measurements. If you have any questions about the app or how to use it, please contact your supervisor. Thank you for your confidence',
      name: 'FirstTimeLogin',
      desc: '',
      args: [],
    );
  }

  /// `Good morning`
  String get OpenAppInMorning {
    return Intl.message(
      'Good morning',
      name: 'OpenAppInMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good morning, you had a really good morning reading yesterday. I am proud of you and keep it up!`
  String get OpenAppInMorningWithGoodMeasurement {
    return Intl.message(
      'Good morning, you had a really good morning reading yesterday. I am proud of you and keep it up!',
      name: 'OpenAppInMorningWithGoodMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `Good morning, how are you today? Pay extra attention to your breathing. Inhale, exhale and wait a moment. If that works well, your morning measurement will probably be better than yesterday's.`
  String get OpenAppInMorningWithBadMeasurement {
    return Intl.message(
      'Good morning, how are you today? Pay extra attention to your breathing. Inhale, exhale and wait a moment. If that works well, your morning measurement will probably be better than yesterday\'s.',
      name: 'OpenAppInMorningWithBadMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `good afternoon`
  String get OpenAppAfterNoon {
    return Intl.message(
      'good afternoon',
      name: 'OpenAppAfterNoon',
      desc: '',
      args: [],
    );
  }

  /// `Good evening`
  String get OpenAppEvening {
    return Intl.message(
      'Good evening',
      name: 'OpenAppEvening',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back! Thank you for being back.`
  String get OpenAppMoreThanFiveDays {
    return Intl.message(
      'Welcome back! Thank you for being back.',
      name: 'OpenAppMoreThanFiveDays',
      desc: '',
      args: [],
    );
  }

  /// `E-Health`
  String get Health {
    return Intl.message(
      'E-Health',
      name: 'Health',
      desc: '',
      args: [],
    );
  }

  /// `Vitality`
  String get vitality {
    return Intl.message(
      'Vitality',
      name: 'vitality',
      desc: '',
      args: [],
    );
  }

  /// `Recovery`
  String get Herstel {
    return Intl.message(
      'Recovery',
      name: 'Herstel',
      desc: '',
      args: [],
    );
  }

  /// `This is perfect!`
  String get DataFromCalculation {
    return Intl.message(
      'This is perfect!',
      name: 'DataFromCalculation',
      desc: '',
      args: [],
    );
  }

  /// `Good luck! Your training has started / Trainze!`
  String get StartTraining {
    return Intl.message(
      'Good luck! Your training has started / Trainze!',
      name: 'StartTraining',
      desc: '',
      args: [],
    );
  }

  /// `You are doing this well, keep moving at this level until the warm up is complete.`
  String get WarningUpAsInProtocol {
    return Intl.message(
      'You are doing this well, keep moving at this level until the warm up is complete.',
      name: 'WarningUpAsInProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Note, you are going too fast. Your heart rate is too high for the warm up. That is why time has stopped. The time will not continue counting down until your heart rate has dropped to the correct training zone. Take it easy, you will soon be able to pop!`
  String get WarningUpAsTooFastForProtocol {
    return Intl.message(
      'Note, you are going too fast. Your heart rate is too high for the warm up. That is why time has stopped. The time will not continue counting down until your heart rate has dropped to the correct training zone. Take it easy, you will soon be able to pop!',
      name: 'WarningUpAsTooFastForProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Well done, your warm up is complete. Now slowly increase your heart rate until you reach the heart rate zone you need to train in today`
  String get WarningUpCompleted {
    return Intl.message(
      'Well done, your warm up is complete. Now slowly increase your heart rate until you reach the heart rate zone you need to train in today',
      name: 'WarningUpCompleted',
      desc: '',
      args: [],
    );
  }

  /// `This is perfect, try to hold on to this. You are in the right heart rate zone!`
  String get Endurance1AsInProtocol {
    return Intl.message(
      'This is perfect, try to hold on to this. You are in the right heart rate zone!',
      name: 'Endurance1AsInProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Note, you are going too fast. Your heart rate is too high for Duration 1. Lower your heart rate. Take it easy, you will soon be able to pop!`
  String get Endurance1TooFastForProtocol {
    return Intl.message(
      'Note, you are going too fast. Your heart rate is too high for Duration 1. Lower your heart rate. Take it easy, you will soon be able to pop!',
      name: 'Endurance1TooFastForProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Hi, come on you can do it! Get your heart rate up. This is too low. You have to go to Duration 1!`
  String get Endurance1TooSlow {
    return Intl.message(
      'Hi, come on you can do it! Get your heart rate up. This is too low. You have to go to Duration 1!',
      name: 'Endurance1TooSlow',
      desc: '',
      args: [],
    );
  }

  /// `Good job, Duration 1 finished. Now slowly increase your heart rate to the next heart rate zone!`
  String get Endurance1Completed {
    return Intl.message(
      'Good job, Duration 1 finished. Now slowly increase your heart rate to the next heart rate zone!',
      name: 'Endurance1Completed',
      desc: '',
      args: [],
    );
  }

  /// `Lower your heart rate, you are almost done with your workout. You just need to cool down in the cool down and you're done.`
  String get Endurance1CompletedLowerToCoolDown {
    return Intl.message(
      'Lower your heart rate, you are almost done with your workout. You just need to cool down in the cool down and you\'re done.',
      name: 'Endurance1CompletedLowerToCoolDown',
      desc: '',
      args: [],
    );
  }

  /// `Now slowly increase your heart rate to the next heart rate zone. Expensive 2 for you!`
  String get Endurance1CompletedAndMoveToEndurance2 {
    return Intl.message(
      'Now slowly increase your heart rate to the next heart rate zone. Expensive 2 for you!',
      name: 'Endurance1CompletedAndMoveToEndurance2',
      desc: '',
      args: [],
    );
  }

  /// `This is perfect, try to hold on to this. You are in the right heart rate zone! / Well done, keep it up!`
  String get Endurance2AsInProtocol {
    return Intl.message(
      'This is perfect, try to hold on to this. You are in the right heart rate zone! / Well done, keep it up!',
      name: 'Endurance2AsInProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Hey, come on you can do it! Get your heart rate up. This is too low. You have to go to Duration 2!`
  String get Endurance2TooSlowForProtocol {
    return Intl.message(
      'Hey, come on you can do it! Get your heart rate up. This is too low. You have to go to Duration 2!',
      name: 'Endurance2TooSlowForProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Well done, Duration 2 is finished.`
  String get Endurance2Completed {
    return Intl.message(
      'Well done, Duration 2 is finished.',
      name: 'Endurance2Completed',
      desc: '',
      args: [],
    );
  }

  /// `Now slowly increase your heart rate to the next heart rate zone. Expensive 3 for you!`
  String get Endurance2CompletedAndMoveToEndurance3 {
    return Intl.message(
      'Now slowly increase your heart rate to the next heart rate zone. Expensive 3 for you!',
      name: 'Endurance2CompletedAndMoveToEndurance3',
      desc: '',
      args: [],
    );
  }

  /// `Lower your heart rate, you are almost done with your workout. You just need to cool down in the cool down and you're done.`
  String get Endurance2CompletedAndLowerToCoolDown {
    return Intl.message(
      'Lower your heart rate, you are almost done with your workout. You just need to cool down in the cool down and you\'re done.',
      name: 'Endurance2CompletedAndLowerToCoolDown',
      desc: '',
      args: [],
    );
  }

  /// `This is perfect, try to hold on to this. You are in the right heart rate zone! / Well done, keep it up!`
  String get Endurance3AsinProtocol {
    return Intl.message(
      'This is perfect, try to hold on to this. You are in the right heart rate zone! / Well done, keep it up!',
      name: 'Endurance3AsinProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Note, you are going too fast. Your heart rate is too high for Duration 3. Lower your heart rate. Take it easy, you will soon be able to pop!`
  String get Endurance3TooFastForProtocol {
    return Intl.message(
      'Note, you are going too fast. Your heart rate is too high for Duration 3. Lower your heart rate. Take it easy, you will soon be able to pop!',
      name: 'Endurance3TooFastForProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Hey, come on you can do it! Get your heart rate up. This is too low. You have to go to Duration 3!`
  String get Endurance3TooSlowForProtocol {
    return Intl.message(
      'Hey, come on you can do it! Get your heart rate up. This is too low. You have to go to Duration 3!',
      name: 'Endurance3TooSlowForProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Well done, Duration 3 finished. Now lower your heart rate!`
  String get Endurance3Completed {
    return Intl.message(
      'Well done, Duration 3 finished. Now lower your heart rate!',
      name: 'Endurance3Completed',
      desc: '',
      args: [],
    );
  }

  /// `Lower your heart rate, you are almost done with your workout. You just need to cool down in the cool down and you're done.`
  String get Endurance3CompletedAndLowerToCoolDown {
    return Intl.message(
      'Lower your heart rate, you are almost done with your workout. You just need to cool down in the cool down and you\'re done.',
      name: 'Endurance3CompletedAndLowerToCoolDown',
      desc: '',
      args: [],
    );
  }

  /// `You are now entering the last part of the training. Lower your heart rate to Duration 2 and train on it!`
  String get Endurance3CompletedAndAndMoveToEndurance2 {
    return Intl.message(
      'You are now entering the last part of the training. Lower your heart rate to Duration 2 and train on it!',
      name: 'Endurance3CompletedAndAndMoveToEndurance2',
      desc: '',
      args: [],
    );
  }

  /// `You are now entering the last part of the training. Drop your heart rate to Duration 1 and train on it!`
  String get Endurance3CompletedAndAndMoveToEndurance1 {
    return Intl.message(
      'You are now entering the last part of the training. Drop your heart rate to Duration 1 and train on it!',
      name: 'Endurance3CompletedAndAndMoveToEndurance1',
      desc: '',
      args: [],
    );
  }

  /// `Note, your heart rate is much too high. Lower it to the right training zone you need to train in!`
  String get Intensive {
    return Intl.message(
      'Note, your heart rate is much too high. Lower it to the right training zone you need to train in!',
      name: 'Intensive',
      desc: '',
      args: [],
    );
  }

  /// `Well done! Feels good again, hey. Do not forget to relax for 10 minutes and do your breathing exercises! Measure your recovery with the Free measurement.`
  String get FitheidsProtocolCompleted {
    return Intl.message(
      'Well done! Feels good again, hey. Do not forget to relax for 10 minutes and do your breathing exercises! Measure your recovery with the Free measurement.',
      name: 'FitheidsProtocolCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Your morning measurement is ready, your recovery capacity is good today! Great, the more often you do your breathing exercise today, the more this contributes to your recovery capacity and the fitter you will be again. And if you feel fit already, enjoy it! `
  String get GoodMorningMeasurement {
    return Intl.message(
      'Your morning measurement is ready, your recovery capacity is good today! Great, the more often you do your breathing exercise today, the more this contributes to your recovery capacity and the fitter you will be again. And if you feel fit already, enjoy it! ',
      name: 'GoodMorningMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `Your morning measurement is ready, your capacity for recovery is normal today.`
  String get NormalMorningMeasurement {
    return Intl.message(
      'Your morning measurement is ready, your capacity for recovery is normal today.',
      name: 'NormalMorningMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `Your morning measurement is ready, your recovery capacity is poor today.`
  String get MediocreMorningMeasurement {
    return Intl.message(
      'Your morning measurement is ready, your recovery capacity is poor today.',
      name: 'MediocreMorningMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `Your morning measurement is ready, your recovery capacity is poor today. Try to take more rest today and preferably do your breathing exercise for at least 3x 10 minutes.`
  String get BadMorningMeasurement {
    return Intl.message(
      'Your morning measurement is ready, your recovery capacity is poor today. Try to take more rest today and preferably do your breathing exercise for at least 3x 10 minutes.',
      name: 'BadMorningMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have achieved an achievement. Well done!`
  String get AchievementPopsup {
    return Intl.message(
      'Congratulations! You have achieved an achievement. Well done!',
      name: 'AchievementPopsup',
      desc: '',
      args: [],
    );
  }

  /// `You are now in the yellow heart rate zone, duration 1`
  String get Endaurance1 {
    return Intl.message(
      'You are now in the yellow heart rate zone, duration 1',
      name: 'Endaurance1',
      desc: '',
      args: [],
    );
  }

  /// `You are now in your warm-up. I recommend a minimum warm-up time of 6 minutes.`
  String get WarmingupRepeat {
    return Intl.message(
      'You are now in your warm-up. I recommend a minimum warm-up time of 6 minutes.',
      name: 'WarmingupRepeat',
      desc: '',
      args: [],
    );
  }

  /// `You are now in the green heart rate zone, duration 2`
  String get Endaurance2 {
    return Intl.message(
      'You are now in the green heart rate zone, duration 2',
      name: 'Endaurance2',
      desc: '',
      args: [],
    );
  }

  /// `You are now in the green heart rate zone, duration 3`
  String get Endaurance3 {
    return Intl.message(
      'You are now in the green heart rate zone, duration 3',
      name: 'Endaurance3',
      desc: '',
      args: [],
    );
  }

  /// `You are now in the dark red heart rate zone, intensive 2`
  String get Intensive2 {
    return Intl.message(
      'You are now in the dark red heart rate zone, intensive 2',
      name: 'Intensive2',
      desc: '',
      args: [],
    );
  }

  /// `You are now in your cooling down.`
  String get CoolDownAfterTraining {
    return Intl.message(
      'You are now in your cooling down.',
      name: 'CoolDownAfterTraining',
      desc: '',
      args: [],
    );
  }

  /// `Well done! Feels good again, hey. Do not forget to relax for 10 minutes and do your breathing exercises! Measure your recovery with the Free measurement. `
  String get FreeTrainingCompleted {
    return Intl.message(
      'Well done! Feels good again, hey. Do not forget to relax for 10 minutes and do your breathing exercises! Measure your recovery with the Free measurement. ',
      name: 'FreeTrainingCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Warm up, Duration 1, Duration 2, Duration 3, Intensive or Intensive 2`
  String get Zone {
    return Intl.message(
      'Warm up, Duration 1, Duration 2, Duration 3, Intensive or Intensive 2',
      name: 'Zone',
      desc: '',
      args: [],
    );
  }

  /// `00h: 00m: 00s - 23h 59m 59s`
  String get Time {
    return Intl.message(
      '00h: 00m: 00s - 23h 59m 59s',
      name: 'Time',
      desc: '',
      args: [],
    );
  }

  /// `1 - 240 beats per minute`
  String get Heartrate {
    return Intl.message(
      '1 - 240 beats per minute',
      name: 'Heartrate',
      desc: '',
      args: [],
    );
  }

  /// `0 - 240 km / h`
  String get Speed {
    return Intl.message(
      '0 - 240 km / h',
      name: 'Speed',
      desc: '',
      args: [],
    );
  }

  /// `0.00km - 99.99km`
  String get Distance {
    return Intl.message(
      '0.00km - 99.99km',
      name: 'Distance',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to stop this measurement?`
  String get Quite {
    return Intl.message(
      'Are you sure you want to stop this measurement?',
      name: 'Quite',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to disconnect from device?`
  String get DisconnectFromScreen {
    return Intl.message(
      'Are you sure you want to disconnect from device?',
      name: 'DisconnectFromScreen',
      desc: '',
      args: [],
    );
  }

  /// `You are connected to your heart rate belt`
  String get currentConnectionTitle {
    return Intl.message(
      'You are connected to your heart rate belt',
      name: 'currentConnectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get diconnectPopupTitle {
    return Intl.message(
      'Remove',
      name: 'diconnectPopupTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'bg', countryCode: 'BG'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
      Locale.fromSubtags(languageCode: 'nl', countryCode: 'NL'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}