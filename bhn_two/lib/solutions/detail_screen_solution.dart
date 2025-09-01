import 'package:bhn_two/models/lasagna.dart';
import 'package:flutter/material.dart';

class DetailScreenSolution extends StatelessWidget {
  final Lasagna lasagna;

  const DetailScreenSolution(this.lasagna, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(lasagna.name, style: Theme.of(context).textTheme.titleMedium,),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Image(image: AssetImage(lasagna.image),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(lasagna.description, style: Theme.of(context).textTheme.bodyLarge,),
            ),
          ],
        ),
      ),
    );
  }
}