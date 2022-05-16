// flutter build web
// firebase deploy --only hosting

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
        primarySwatch: Colors.blue,
      ),
      home: CVPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
