import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  //TODO: Need help? Have a look into the recipe_card_solution.dart file
  //TODO: Take the lasagna as parameter from the list
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              child: Image(
                //TODO: Use the Lasagna Model as image source
                image: AssetImage('lib/assets/images/lasagna.jpg'),
              ),
            ),
            Flexible(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //TODO: Use tha lasagna model as title and description source
                    Text(
                      "Lasagna",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text("Delicious Lasagna, you will enjoy a lot!"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
