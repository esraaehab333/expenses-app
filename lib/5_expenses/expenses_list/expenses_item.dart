
import 'package:flutter/material.dart';

import '../models/expanses.dart';

class ExpensesItem extends StatelessWidget {
  ExpensesItem({super.key, required this.expense});
  final Expanse expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(expense.title, style: Theme.of(context).textTheme.titleLarge,),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text("\$${expense.amount.toStringAsFixed(2)}"),
              Spacer(),
              Row(
                children: [
                  Icon(categoryIcon[expense.category]),
                  SizedBox(width: 4,),
                  Text(expense.formattedDate),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
