import 'package:bhn_two/models/lasagna.dart';
import 'package:bhn_two/recipe_card.dart';
import 'package:bhn_two/solutions/detail_screen_solution.dart';
import 'package:flutter/material.dart';

class MainScreenSolution extends StatefulWidget
{
  const MainScreenSolution({super.key});
  
  @override
  State<StatefulWidget> createState() => _MainScreenSolutionState();
}

class _MainScreenSolutionState extends State<MainScreenSolution>
{
  List<Lasagna> lasagnas = [
    Lasagna("Lasagna bolognaise","The classic lasagna with delicious beef ragout and tomatoes."),
    Lasagna("Lasagna spinach","Creamy green version of lasagna, excellent as a veggi alternative to bolognese.", image: "lib/assets/images/spinach_lasagna.jpg"),
    Lasagna("Lasagna salmon","A modern interpretation of the italian classic, delicious with salmon.",image: "lib/assets/images/salmon_lasagna.jpg"),
    Lasagna("Chocolate lasagna", "What sweet angel from heaven is this!?",image: "lib/assets/images/chocolate_lasagna.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: RecipeCard(lasagnas[index]),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DetailScreenSolution(lasagnas[index],() {
                    setState(() {
                      lasagnas.removeAt(index);
                    });
                  },);
                },
              ),
            );
          },
        );
      },
      itemCount: lasagnas.length,
    );
  }
}