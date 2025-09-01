import 'package:bmdb/presentation/screens/favorites_screen.dart';
import 'package:bmdb/presentation/view_models/dashboard_view_model.dart';
import 'package:bmdb/presentation/views/bmdb_app_bar.dart';
import 'package:bmdb/presentation/views/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<DashboardViewModel>().loadTrending();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DashboardViewModel viewModel = context.watch<DashboardViewModel>();
    if (viewModel.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: BmdbAppBar(
        title: "Dashboard",
        showsFavorites: true,
        onTrendingTapped: viewModel.loadTrending,
        onFavoritesTapped: () async {
          await Navigator.of(context).push(
            MaterialPageRoute<FavoritesScreen>(
              builder: (context) {
                return FavoritesScreen();
              },
            ),
          );
          viewModel.checkForUpdatedFavorites();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Nach Film/Serie suchen",
                fillColor: Colors.white70,
                suffixIcon: _searchTextController.text.isEmpty ? null : IconButton(onPressed: () {
                  _searchTextController.clear();
                  viewModel.loadTrending();
                }, icon: Icon(Icons.clear))
              ),
              onSubmitted: viewModel.searchSubmitted,
            ),
          ),
          MovieList(movies: viewModel.movies, onMovieFavoriteTap: viewModel.onMovieFavoriteTap)
        ],
      ),
    );
  }
}
