import 'package:expense_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class ExpenseAppView extends StatelessWidget {
  const ExpenseAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: const Color(0xFF00B2E7),
          secondary: const Color(0xFFE064F7),
          tertiary: const Color(0xFFFF8D6C),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
