import 'package:bmdb/presentation/view_models/favorites_view_model.dart';
import 'package:bmdb/presentation/views/bmdb_app_bar.dart';
import 'package:bmdb/presentation/views/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<FavoritesViewModel>().loadFavorites();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoritesViewModel>();
    return Scaffold(
      appBar: BmdbAppBar(title: "Favoriten", showsFavorites: false),
      body: viewModel.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                MovieList(
                  movies: viewModel.favoriteMovies,
                  onMovieFavoriteTap: viewModel.onMovieFavoriteTap,
                ),
              ],
            ),
    );
  }
}
