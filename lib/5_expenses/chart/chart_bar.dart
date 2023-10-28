import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});
  final double fill;
  @override
  Widget build(BuildContext context) {
    final bool isDartMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top:Radius.circular(10)),
                color: isDartMode
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context)
                    .colorScheme
                    .secondary
                    .withOpacity(0.8),
              ),
            ),
            heightFactor: fill),
      ),
    );
  }
}
