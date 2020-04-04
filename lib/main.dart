import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/helper/fallback_cupertino_localisations_delegate.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/helper/router.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

final globalNavigatorKey = GlobalKey<NavigatorState>();
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

getFcmToken() {
  firebaseMessaging.getToken().then((String token) {
    assert(token != null);
    print('FCM_TOKEN $token');
    SharedPreferences.getInstance().then((preference) {
      preference.setString(Constant.FCM_TOKEN, token);
    });
  });
}

class MyApp extends StatefulWidget {

  // Don't forget to change BASE_API to Constant.API_PRODUCTION when building apk / when testing live server //
  static const BASE_API = Constant.API_STAGING;

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _locale;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  _showNotification(Map<String, dynamic> message) {
    String title = message['notification']['title'].toString();
    String body = message['notification']['body'].toString();
    _showNotificationWithDefaultSound(title, body);
  }

  Future _showNotificationWithDefaultSound(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'com.gamatechno.eovizpresence', 'com.gamatechno.eovizpresence', 'com.gamatechno.eovizpresence',
      importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  _fetchLocale() async {
    Locale tempLocale;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = (prefs.getString(Constant.LANGUANGE_CODE) ?? Constant.INDONESIAN);

    switch (languageCode) {
      case Constant.ENGLISH:
        tempLocale = Locale(Constant.ENGLISH);
        break;
      case Constant.INDONESIAN:
        tempLocale = Locale(Constant.INDONESIAN);
        break;
      default:
        tempLocale = Locale(Constant.ENGLISH);
    }

    return tempLocale;
  }

  @override
  void didChangeDependencies() {
    this._fetchLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // this code to make apps to only allows portrait mode //
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    Future onSelectNotification(String payload) async {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('PayLoad'),
            content: Text('Payload : $payload'),
          );
        },
      );
    }

    // this code to make apps to only allows portrait mode
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    var initializationSettingsAndroid = AndroidInitializationSettings('');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);

    firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print('Settings registered: $settings');
    });
    firebaseMessaging.onTokenRefresh.listen((newFcmToken) {
      print('NEW_FCM_TOKEN $newFcmToken');
      SharedPreferences.getInstance().then((preference) {
        preference.setString(Constant.FCM_TOKEN, newFcmToken);
        preference.setBool(Constant.IS_LOGIN, false);
      });
    });
    getFcmToken();

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        //int key1 = int.parse(message["data"]["key1"]);
        //String key2 = message["data"]["key2"].toString();
        _showNotification(message);
        print('onMessage: $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        _showNotification(message);
        print('onLaunch: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        _showNotification(message);
        print('onResume: $message');
      },
    );

    return this._locale == null ?
    Container(
      color: ThemeColor.bg_screen,
    ) :
    MaterialApp(
      title: 'Eoviz Presence',
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FallbackCupertinoLocalisationsDelegate()
      ],
      supportedLocales: [
        Locale(Constant.ENGLISH),
        Locale(Constant.INDONESIAN),
      ],
      locale: _locale,
      navigatorKey: globalNavigatorKey,
      initialRoute: Router.initialRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
