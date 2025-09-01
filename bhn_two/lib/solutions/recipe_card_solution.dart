import 'package:bhn_two/models/lasagna.dart';
import 'package:flutter/material.dart';

class RecipeCardSolution extends StatelessWidget {
  final Lasagna lasagna;

  const RecipeCardSolution(this.lasagna, {super.key});

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
                image: AssetImage(lasagna.image),
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
                    Text(
                      lasagna.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(lasagna.description),
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