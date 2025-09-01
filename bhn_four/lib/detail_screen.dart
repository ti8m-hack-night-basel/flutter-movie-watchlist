import 'package:bhn_two/models/lasagna.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Lasagna lasagna;
  final VoidCallback deleteCallback;

  const DetailScreen(this.lasagna, this.deleteCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                deleteCallback();
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.delete),
              ),
            )
          ],
          title: Text(
            lasagna.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Image(
              image: AssetImage(lasagna.image),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                lasagna.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}