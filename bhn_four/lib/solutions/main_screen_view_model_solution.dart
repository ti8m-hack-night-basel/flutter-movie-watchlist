import 'package:bhn_two/models/lasagna.dart';
import 'package:flutter/material.dart';

class MainScreenViewModelSolution extends ChangeNotifier {

  Lasagna? selectedLasagna;

  List<Lasagna> lasagnas = [
    Lasagna("Lasagna bolognaise","The classic lasagna with delicious beef ragout and tomatoes."),
    Lasagna("Lasagna spinach","Creamy green version of lasagna, excellent as a veggi alternative to bolognese.", image: "lib/assets/images/spinach_lasagna.jpg"),
    Lasagna("Lasagna salmon","A modern interpretation of the italian classic, delicious with salmon.",image: "lib/assets/images/salmon_lasagna.jpg"),
    Lasagna("Chocolate lasagna", "What sweet angel from heaven is this!?",image: "lib/assets/images/chocolate_lasagna.jpg"),
  ];

  void onLasagnaTap(int index) {
    selectedLasagna = lasagnas[index];
    notifyListeners();
  }

  void removeSelectedLasagna() {
    if(selectedLasagna == null) { return; }
    lasagnas.remove(selectedLasagna);
    selectedLasagna = null;
    notifyListeners();
  }
}