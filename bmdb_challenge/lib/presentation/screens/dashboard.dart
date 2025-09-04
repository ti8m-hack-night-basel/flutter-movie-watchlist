import 'package:bmdb/presentation/view_models/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DashboardViewModel>();
    return Scaffold(
      body: Center(
        child: Text(
          "Dashboard / Landing Page",
        ),
      ),
    );
  }
}
