import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid = Uuid(); //object
final dateFormat = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expanse {
  final String id, title;
  final double amount;
  final DateTime data;
  final Category category;
  String get formattedDate {
    return dateFormat.format(data);
  }

  Expanse(
      {required this.title,
      required this.data,
      required this.amount,
      required this.category})
      : id = uuid.v4();
  //ال id بيكون لازم يبقي يونيك و كمان انا اللي ادهوله
}

class ExpensesBucket {
  final Category category;
  final List<Expanse> expenses;

  ExpensesBucket(this.category, this.expenses);
  ExpensesBucket.forCategory(List<Expanse> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();
  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
