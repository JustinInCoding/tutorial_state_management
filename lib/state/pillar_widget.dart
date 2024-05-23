import 'package:flutter/material.dart';
import '../models/pillar.dart';

class PillarInheritedWidget extends InheritedWidget {
  final PillarState state;
  final int articleCount;

  const PillarInheritedWidget(
      {super.key,
      required super.child,
      required this.articleCount,
      required this.state});

  static PillarState of(BuildContext context) {
    final PillarInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<PillarInheritedWidget>();
    assert(result != null, 'No pillarWidget found in context!');
    return result!.state;
  }

  @override
  bool updateShouldNotify(PillarInheritedWidget oldWidget) {
    return oldWidget.articleCount != articleCount;
  }
}

class PillarStatefulWidget extends StatefulWidget {
  final Widget child;
  final Pillar pillar;

  const PillarStatefulWidget(
      {super.key, required this.child, required this.pillar});

  @override
  State<PillarStatefulWidget> createState() => PillarState();
}

class PillarState extends State<PillarStatefulWidget> {
  get articleCount => widget.pillar.articleCount;
  get imageName => widget.pillar.type.imageName;

  void increaseArticleCount({int by = 1}) {
    setState(() {
      widget.pillar.increaseArticleCount(by: by);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PillarInheritedWidget(
      articleCount: widget.pillar.articleCount,
      state: this,
      child: widget.child,
    );
  }
}
