import 'package:flutter/material.dart';
import 'package:tutorial_tracker/models/pillar.dart';
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
  late ValueNotifier<int> valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier<int>(pillar.articleCount);
    valueNotifier.addListener(() {
      setState(() {
        final increaseAmount = valueNotifier.value - pillar.articleCount;
        pillar.increaseArticleCount(by: increaseAmount);
      });
    });
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial Tracker',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tutorial Tracker'),
        ),
        body: TutorialsPage(
          pillar: pillar,
          valueNotifier: valueNotifier,
        ),
      ),
    );
  }
}
