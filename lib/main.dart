import 'package:flutter/material.dart';
import 'package:tutorial_tracker/models/pillar.dart';
import 'package:tutorial_tracker/state/pillar_widget.dart';
import 'pages/tutorials_page.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final pillar = Pillar(type: PillarType.flutter, articleCount: 115);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial Tracker',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tutorial Tracker'),
        ),
        body: PillarStatefulWidget(
          pillar: pillar,
          child: const TutorialsPage(),
        ),
      ),
    );
  }
}
