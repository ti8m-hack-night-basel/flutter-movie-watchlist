import 'package:bhn_two/detail_screen.dart';
import 'package:bhn_two/models/lasagna.dart';
import 'package:bhn_two/recipe_card.dart';
import 'package:bhn_two/solutions/main_screen_solution.dart';
import 'package:bhn_two/solutions/main_screen_view_model_solution.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        home: ChangeNotifierProvider(
          create: (context) => //TODO: Have the change notifier return you ViewModel!
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("My Lasagnas", style: Theme.of(context).textTheme.titleMedium,),
              ),
              body: MainScreen(),
            ),
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
  //TODO: Init the mainScreenViewModel
  //TODO: Have the view model provide the lasagnas to the MainScreen
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
            //TODO: Have the Viewmodel react to the tap
            //TODO: !!ATTENTION!! Trap, Navigation belongs to UI! So it needs to happen in MainScreenState!
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DetailScreen(lasagnas[index],() {
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
