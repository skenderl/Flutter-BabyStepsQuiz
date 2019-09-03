import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  List<ProgressKind> progress;

  Progress({
    Key key,
    this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: progress.map((kind) {
              return Text(_convertToStringFromProgressKind(kind));
              }).toList(),
            ),
          );
  }

  String _convertToStringFromProgressKind(ProgressKind kind) {
    switch (kind) {
      case ProgressKind.correct:
        return '⭕️️️';
      case ProgressKind.incorrect:
        return '❌';
      case ProgressKind.notYet:
        return '▫️';
      case ProgressKind.current:
        return '🔷';
    }
    assert(false, 'invalid kind: $kind');
    return '';
  }
}

enum ProgressKind {
  correct,
  incorrect,
  current,
  notYet,
}
