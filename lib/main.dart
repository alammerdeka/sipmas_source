import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipmas/provider/providers.dart';
import 'package:sipmas/screens/pegawai/pegawai_screens.dart';

import 'package:sipmas/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<BeritaProvider>(
            create: (context) => BeritaProvider()),
        ChangeNotifierProvider<PegawaiProvider>(
            create: (context) => PegawaiProvider()),
        ChangeNotifierProvider<SuratProvider>(
            create: (context) => SuratProvider()),



      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          '/main': (context) => MainScreen(),
          '/mainPegawai': (context)=>MainScreenPegawai(),
          '/login': (context) => LoginScreen(),
          '/regist': (context) => RegisterScreen(),
          '/validator': (context) => ValidasiScreen(),

        },
      ),
    );

  }
}


