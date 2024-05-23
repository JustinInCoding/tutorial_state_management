import 'package:flutter/material.dart';
import 'package:tutorial_tracker/models/pillar.dart';

class TutorialWidget extends StatefulWidget {
  final Pillar pillar;
  const TutorialWidget({super.key, required this.pillar});

  @override
  State<TutorialWidget> createState() => _TutorialWidgetState();
}

class _TutorialWidgetState extends State<TutorialWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            widget.pillar.increaseArticleCount();
          },
          child:
              Image.asset('assets/images/${widget.pillar.type.imageName}', width: 110, height: 110),
        ),
        Positioned(
          bottom: 2,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(widget.pillar.articleCount.toString()),
          ),
        )
      ],
    );
  }
}
