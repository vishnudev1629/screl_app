import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_campaign_app/screens/campaign_screen.dart';
import 'package:screl_campaign_app/test/test_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campaign Creator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen2(),
    );
  }
}
