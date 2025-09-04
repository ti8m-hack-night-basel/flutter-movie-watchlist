import 'package:bmdb/presentation/screens/dashboard.dart';
import 'package:bmdb/presentation/view_models/dashboard_view_model.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Basel Movie Database',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SafeArea(
          child: Dashboard(),
        ),
      ),
    );
  }
}
