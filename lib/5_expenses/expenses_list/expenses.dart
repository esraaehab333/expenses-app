
import 'package:flutter/material.dart';

import '../chart/chart.dart';
import '../models/expanses.dart';
import 'expenses_list.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expanse> _registerExpenses = [
  ];
  void _addExpense(Expanse expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _delExpense(Expanse expense) {
    setState(() {
      _registerExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var m = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Expenses App"), actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
             // isScrollControlled: true,بيخليها بطول الشاشه كلها
            //  useSafeArea: true,//بيخليها مش تيجي ناحيه الكاميرا او الجزء اللي فوق
              shape: const RoundedRectangleBorder(
                // <-- SEE HERE
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              builder: (ctx) => NewExpense(onAddExpense: _addExpense),
            );
          },
          icon: Icon(Icons.add),
        )
      ]),
      body: Center(
        child: m < 600
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chart(expenses: _registerExpenses),
                  Expanded(
                    child: ExpensesList(
                      expenses: _registerExpenses,
                      onRemove: _delExpense,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Chart(expenses: _registerExpenses)),
                  Expanded(
                    child: ExpensesList(
                      expenses: _registerExpenses,
                      onRemove: _delExpense,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
