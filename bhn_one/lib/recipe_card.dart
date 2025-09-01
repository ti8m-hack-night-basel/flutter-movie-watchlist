import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Text("TODO: Remove this Text and add UI elements to build the UI of exercise 1 "
            "Have a close look and think of how to split the UI into Rows and Columns "
            "If you're stuck or need help, you can find one solution example in the solution.dart file"),
      ),
    );
  }
}
