import 'package:ashton_hengel_club/global/colors.dart';
import 'package:ashton_hengel_club/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

void main(){
  SystemChrome.setEnabledSystemUIOverlays([]);
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AHK',
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        accentColor: BACKGROUND_COLOR,
        backgroundColor: BACKGROUND_COLOR,
      ),
      home: LoginPage(),
    );
  }
}

