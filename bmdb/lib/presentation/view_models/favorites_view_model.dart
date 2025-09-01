import 'package:bmdb/data/preferences/bmdb_preferences.dart';
import 'package:bmdb/domain/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesViewModel extends ChangeNotifier
{
    bool isLoading = false;
    List<Movie> favoriteMovies = List.empty();

    loadFavorites() async {
      isLoading = true;
      notifyListeners();
      favoriteMovies = (await SharedPreferences.getInstance()).getFavorites();
      isLoading = false;
      notifyListeners();
    }

    void onMovieFavoriteTap(Movie movie) async {
      var preferences = await SharedPreferences.getInstance();
      preferences.removeMovieFromFavorites(movie);
      loadFavorites();
    }
}