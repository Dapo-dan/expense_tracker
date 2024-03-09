import 'package:expense_tracker/constants/ui_helpers.dart';
import 'package:expense_tracker/screens/stat/chart.dart';
import 'package:flutter/material.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transactions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(20),
            Container(
              width: screenWidth(context),
              height: screenWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(
                  12,
                  20,
                  12,
                  12,
                ),
                child: MyChart(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
