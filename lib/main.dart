import 'package:consulta_integrada/firebase_messaging/custom_firebase_messaging.dart';
import 'package:consulta_integrada/styles/theme/default.theme.dart';
import 'package:consulta_integrada/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CustomFirebaseMessaging().inicialize();
  await CustomFirebaseMessaging().getTokenFirebase();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Consulta Integrada',
        debugShowCheckedModeBanner: false,
        theme: DefaultTheme.getTheme(),
        home: SplashView());
  }
}
