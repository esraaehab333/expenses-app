
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/expanses.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required List<Expanse> expenses, required this.onRemove,
  }) : expanses = expenses;
  final List<Expanse> expanses;
  final void Function(Expanse expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expanses.length,
        itemBuilder: (context, index) => Dismissible(
          background: Container(color:Theme.of(context).colorScheme.error.withOpacity(0.8),
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal,)),
          onDismissed: (direction)=>onRemove(expanses[index]),
            key: ValueKey(expanses[index]),
            child: ExpensesItem(
              expense: expanses[index],
            )));
  }
}
