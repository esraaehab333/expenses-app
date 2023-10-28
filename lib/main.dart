
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '5_expenses/expenses_list/expenses.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();//لازم احط السطر دا ف البدايه عشان هيديني ايرور
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));
}
//الداله دي بتحددلي الاتجاه بتاع الابلكيشن الطبيعي بتاعي و عشان انا مش عاوزه احط المتغير ممكن احط _
var myColorScheme =
ColorScheme.fromSeed(seedColor: const Color.fromRGBO(25, 59, 96, 179));
var myDarkColorScheme =
ColorScheme.fromSeed(seedColor: const Color.fromRGBO(25, 59, 96, 179));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorScheme,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: myColorScheme.onPrimaryContainer,
            foregroundColor: myColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: myColorScheme.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: myColorScheme.onSecondaryContainer,
            fontSize: 17,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: myDarkColorScheme,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: myDarkColorScheme.onPrimaryContainer,
              foregroundColor: myDarkColorScheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: myDarkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: myDarkColorScheme.onPrimaryContainer,
                foregroundColor: myDarkColorScheme.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: myDarkColorScheme.onSecondaryContainer,
              fontSize: 17,
            ),
          ),
          bottomSheetTheme: BottomSheetThemeData().copyWith(
            backgroundColor: myDarkColorScheme.onPrimaryContainer,
          )),
      home: Scaffold(
        body: Expenses(),
      ),
    );
  }
}