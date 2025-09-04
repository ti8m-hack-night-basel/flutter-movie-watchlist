import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        //TODO: Remove this Text and add UI elements to build the UI of exercise 1
        //TODO: Have a close look and think of how to split the UI into Rows and Columns
        //TODO: See how to utilise main and cross-axis alignemt to our advantage
        //TODO: tip: you can tell your Row or Column to not take all space by defining its mainAxisSize as min
        //TODO: Remember the usage of Expanded and/or Flexible and its flex attribute
        //TODO: If you're stuck or need help, you can find one solution example in the solution.dart file
        child: Text("TODO: Remove this Text and add UI elements to build the UI of exercise 1 "
            "Have a close look and think of how to split the UI into Rows and Columns"
            "If you're stuck or need help, you can find one solution example in the solution.dart file"),
      ),
    );
  }
}
