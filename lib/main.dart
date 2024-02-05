import 'package:flutter/material.dart';
import 'package:icons/n64_logo.dart';
import 'package:icons/nes_controll_logo.dart';
import 'package:icons/ps_one_logo.dart';
import 'package:icons/ps_vita_logo.dart';

import 'package:icons/sega_logo.dart';
import 'package:icons/switch_logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PsVitaLogo(),
          ],
        ),
      ),
    );
  }
}
