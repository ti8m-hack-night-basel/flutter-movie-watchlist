import 'package:bhn_two/detail_screen.dart';
import 'package:bhn_two/recipe_card.dart';
import 'package:bhn_two/solutions/main_screen_view_model_solution.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenSolution extends StatefulWidget {
  const MainScreenSolution({super.key});

  @override
  State<MainScreenSolution> createState() => _MainScreenSolutionState();
}

class _MainScreenSolutionState extends State<MainScreenSolution> {
  @override
  void initState() {
    super.initState();
    MainScreenViewModelSolution viewModel = context.read<MainScreenViewModelSolution>();
    viewModel.addListener(
      () {
        if (viewModel.selectedLasagna != null) {
          navigateToDetails();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MainScreenViewModelSolution viewModel = context.watch<MainScreenViewModelSolution>();
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            viewModel.onLasagnaTap(index);
          },
          child: RecipeCard(viewModel.lasagnas[index]),
        );
      },
      itemCount: viewModel.lasagnas.length,
    );
  }

  void navigateToDetails() {
    MainScreenViewModelSolution viewModel = context.read<MainScreenViewModelSolution>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(
            viewModel.selectedLasagna!,
            viewModel.removeSelectedLasagna,
          );
        },
      ),
    );
  }
}
