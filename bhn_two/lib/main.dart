import 'package:bhn_two/models/lasagna.dart';
import 'package:bhn_two/recipe_card.dart';
import 'package:bhn_two/solutions/main_screen_solution.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BHNTwo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("My Lasagnas", style: Theme.of(context).textTheme.titleMedium,),
            ),
            body: MainScreenSolution(),
          ),
        ));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Lasagna> lasagnas = [
    Lasagna("Lasagna bolognaise","The classic lasagna with delicious beef ragout and tomatoes."),
    Lasagna("Lasagna spinach","Creamy green version of lasagna, excellent as a veggi alternative to bolognese.", image: "lib/assets/images/spinach_lasagna.jpg"),
    Lasagna("Lasagna salmon","A modern interpretation of the italian classic, delicious with salmon.",image: "lib/assets/images/salmon_lasagna.jpg"),
    Lasagna("Chocolate lasagna", "What sweet angel from heaven is this!?",image: "lib/assets/images/chocolate_lasagna.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    //TODO: Need help? Have a look into the MainScreenSolution.dart file.
    //TODO: provide the list of lasagnas as source to build the list
    return ListView.builder(
      itemBuilder: (context, index) {
        //TODO: Make this Card tappable and navigate to the Detail Screen
        //TODO: Providing the Lasagna Model at the tapped index
        return RecipeCard();
      },
      itemCount: 10,
    );
  }
}
