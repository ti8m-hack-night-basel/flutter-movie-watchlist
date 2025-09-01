import 'package:bmdb/data/preferences/bmdb_preferences.dart';
import 'package:bmdb/domain/models/movie.dart';
import 'package:bmdb/domain/use_cases/movie_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardViewModel extends ChangeNotifier {
  bool isLoading = true;
  List<Movie> movies = List.empty();

  Future loadTrending() async {
    isLoading = true;
    notifyListeners();
    movies = await MovieUseCases().getTrendingMovies();
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchSubmitted(String title) async {
    if (title.isEmpty) {
      return; //Do nothing if nothing was entered
    }
    isLoading = true;
    notifyListeners();
    movies = await MovieUseCases().findMovie(title);
    isLoading = false;
    notifyListeners();
  }

  void onMovieFavoriteTap(Movie movie) async {
    var preferences = await SharedPreferences.getInstance();
    if (movie.isFavorite) {
      preferences.removeMovieFromFavorites(movie);
    } else {
      preferences.addMovieToFavorites(movie);
    }
    movie.isFavorite = !movie.isFavorite;
    notifyListeners();
  }

  void checkForUpdatedFavorites() async {
    final favorites = (await SharedPreferences.getInstance()).getFavorites();
    movies.where((movie) => movie.isFavorite).forEach((m) {
      m.isFavorite = favorites.contains(m);
    },);
    notifyListeners();
  }
}
