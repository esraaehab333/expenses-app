import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expanses.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expanse expanse) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // الطرييقه الاولي اللي ممكن ناخد بيها قيمه الطريقه التانيه هي الكنترولار
  //var _title = '';
  // void _saveTitleInput(String inputValue) {
  //   setState(() {
  //     _title = inputValue;
  //   });
  // }
  TextEditingController _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  final formatter = DateFormat.yMd();
  Category _selectedCategory = Category.travel;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();

    // خلف الكواليس هو شغال ف دي بتوقف الكونترولار
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller:
                    _titleController, //دي الطريقه التانيه بس هتفرق ف الاخراج اني بطلعها لما يحصل حدث
                // onChanged:
                //     _saveTitleInput, //بكل مره تتغير الكتابه هو هيسند الاسترنج دا للاسترنج اللي هنا
                maxLength: 50, //طول الاحرف المدخله
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller:
                          _amountController, //دي الطريقه التانيه بس هتفرق ف الاخراج اني بطلعها لما يحصل حدث
                      // onChanged:
                      //     _saveTitleInput, //بكل مره تتغير الكتابه هو هيسند الاسترنج دا للاسترنج اللي هنا

                      keyboardType: TextInputType.number,
                      maxLength: 50, //طول الاحرف المدخله
                      decoration: const InputDecoration(
                        label: Text("Amount"),
                        //فيه بريفكس و سافيكس
                        // جوه الديكوريشن
                        prefixText: "\$",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_selectedDate == null
                            ? "No Date Selected"
                            : formatter.format(_selectedDate!)),
                        IconButton(
                          onPressed: () async {
                            final now = DateTime.now();
                            final firstDate =
                                DateTime(now.year - 1, now.month, now.day);
                            // showDatePicker(
                            //     context: context,
                            //     initialDate: now,
                            //     firstDate: firstDate,
                            //     lastDate: now).then((value) => print(value.toString()));
                            //دي داله جاهزه ف الفلاتر عشان اعرف اتعامل مع الوقت و التاريخ و الخ بقا
                            //دي الطريقه الاولي عندي فيه طريقه تانيه اسهل
                            final DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: now,
                                firstDate: firstDate,
                                lastDate: now);
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          },
                          icon: Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e.name),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (newVal) {
                        if (newVal == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = newVal;
                        });
                      }),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        //ازاي الغي الشيت بقا
                        Navigator.pop(context); //الغاء او اغلاق الكونكست
                      },
                      child: Text("Cancel")),
                  ElevatedButton(
                    onPressed: () {
                      final double? enterAmount =
                          double.tryParse(_amountController.text);
                      const snackBar = SnackBar(
                        content: Text("Error"),
                      );
                      final amountIsValid =
                          enterAmount == null || enterAmount <= 0;
                      if (_titleController.text.trim().isEmpty ||
                          amountIsValid ||
                          _selectedDate == null) {
                        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text("Invalid "),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: Text("Okey"),
                                    ),
                                  ],
                                ));
                      } else {
                        widget.onAddExpense(Expanse(
                            title: _titleController.text,
                            data: _selectedDate!,
                            amount: enterAmount,
                            category: _selectedCategory));
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Save Expense"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
