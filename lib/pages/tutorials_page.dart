import 'package:flutter/material.dart';
import 'package:tutorial_tracker/models/pillar.dart';
import '../widgets/tutorial_widget.dart';

class TutorialsPage extends StatefulWidget {
  final Pillar pillar;
  final ValueNotifier<int> valueNotifier;
  const TutorialsPage({super.key, required this.pillar, required this.valueNotifier});

  @override
  State<TutorialsPage> createState() => _TutorialsPageState();
}

class _TutorialsPageState extends State<TutorialsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child: TutorialWidget(pillar: widget.pillar, valueNotifier: widget.valueNotifier,)),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            'Total Tutorials: ${widget.pillar.articleCount}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
