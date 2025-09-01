import 'package:bhn_two/models/lasagna.dart';
import 'package:flutter/material.dart';

//TODO: Need help? Have a look into the detail_screen_solution.dart file
class DetailScreen extends StatelessWidget {
  final Lasagna lasagna;
  //TODO: Add a Function as callback that will be called if the Lasagna is deleted
  const DetailScreen(this.lasagna, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //TODO: Add a delete action to the AppBar, calling the callback function when tapped
        //TODO: Navigate back when tapped
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