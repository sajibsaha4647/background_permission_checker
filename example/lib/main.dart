import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:background_permission_checker/background_permission_checker.dart';
import 'package:flutter/material.dart';
import 'package:background_permission_checker/background_permission_checker.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Auto-Start Checker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                bool enabled = await BackgroundChecker.isAutoStartEnabled();
                print("Auto-start: $enabled");
              },
              child: Text("Check Auto-Start"),
            ),
            ElevatedButton(
              onPressed: () async {
                await BackgroundChecker.openAutoStartSettings();
              },
              child: Text("Open Auto-Start Settings"),
            ),
          ],
        ),
      ),
    );
  }
}





