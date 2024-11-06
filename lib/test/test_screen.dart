import 'package:flutter/material.dart';
import 'package:screl_campaign_app/core/db/shared/sharedpref.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              SetSharedPreferences.storePreview("name");
            },
             child: Text("set")),
              ElevatedButton(
                onPressed: () async {
                  final a = await GetSharedPreferences.getPreview();
                  print(a ?? 'No found');
                },
                child: Text("Get Data"),
              ),
             ],
      ),
    );
  }
}
