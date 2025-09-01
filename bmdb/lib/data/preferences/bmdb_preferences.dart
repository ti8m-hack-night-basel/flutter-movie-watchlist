import 'package:bmdb/domain/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';


extension BMDBPreferences on SharedPreferences {

  void addMovieToFavorites(Movie movie) {
    final favorites = getFavorites();
    if(!favorites.contains(movie)) {
      favorites.add(movie);
      setStringList("Favorites", favorites.map((e) => e.toJson(),).toList());
    }
  }

  void removeMovieFromFavorites(Movie movie) {
    final favorites = getFavorites();
    if(favorites.contains(movie)) {
      favorites.remove(movie);
      setStringList("Favorites", favorites.map((e) => e.toJson(),).toList());
    }
  }

  List<Movie> getFavorites() {
    final list = getStringList("Favorites");
    return list?.map((e) {
      final movie = Movie.fromJson(e);
      movie.isFavorite = true;
      return movie;
    },).toList() ?? List.empty(growable: true);
  }
}