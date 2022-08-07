// firebase login
// firebase logout
// flutter build web && firebase deploy --only hosting

import 'package:cv/cv_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  return runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1m1',
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        primaryColor: Colors.white,
        backgroundColor: Colors.black,
        textTheme: Typography.whiteCupertino,
        focusColor: Color.fromRGBO(212, 45, 121, 1),
        listTileTheme: ListTileThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.white)),
            selectedColor: Colors.amber,
            selectedTileColor: Colors.blue,
            tileColor: Colors.black,
            iconColor: Colors.pink),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.black,
        indicatorColor: Colors.blue,
      ),
      home: CVPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
