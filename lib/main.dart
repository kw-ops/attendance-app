import 'package:attendance/database/konkonsa.dart';
import 'package:attendance/database/user_details_provider.dart';
import 'package:attendance/views/attstudent.dart';
import 'package:attendance/views/btmscrstudent.dart';
import 'package:attendance/views/histstudent.dart';
import 'package:attendance/views/homestu.dart';
import 'package:attendance/views/profilescreen.dart';
import 'package:attendance/views/signin.dart';
import 'package:attendance/views/splash.dart';
import 'package:attendance/views/usertypescreen.dart';
import 'package:attendance/views/verifyscrstud.dart';
import 'package:attendance/views/welcome.dart';
import 'package:attendance/widget/utils/internet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/location.dart';
import 'widget/utils/location_service.dart';
import 'widget/utils/next_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => UserDetailsProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => InternetProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => KonKonsa()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
