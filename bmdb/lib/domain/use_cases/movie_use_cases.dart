import 'package:bmdb/data/preferences/bmdb_preferences.dart';
import 'package:bmdb/domain/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieUseCases {
  Future<List<Movie>> getTrendingMovies() async{
    final tmdbWithCustomLogs = TMDB(
        ApiKeys('e29a01ed391c7e0d6bf26906170a2d61', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjlhMDFlZDM5MWM3ZTBkNmJmMjY5MDYxNzBhMmQ2MSIsIm5iZiI6MTc0NDAyODc4OC44ODEsInN1YiI6IjY3ZjNjNDc0MzFjOWYyNzI5OWFkMGRiYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MRDfDld4O1-5GeD_wV8lQ8cvQ0-wr0ojOGUEf8BGE4w'),
        defaultLanguage:'de-DE'// sets default language for all supported endpoints
    );
    final result = await tmdbWithCustomLogs.v3.trending.getTrending();
    return processResult(result);
  }

  Future<List<Movie>> findMovie(String title) async{
    final tmdbWithCustomLogs = TMDB(
        ApiKeys('e29a01ed391c7e0d6bf26906170a2d61', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjlhMDFlZDM5MWM3ZTBkNmJmMjY5MDYxNzBhMmQ2MSIsIm5iZiI6MTc0NDAyODc4OC44ODEsInN1YiI6IjY3ZjNjNDc0MzFjOWYyNzI5OWFkMGRiYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MRDfDld4O1-5GeD_wV8lQ8cvQ0-wr0ojOGUEf8BGE4w'),
        defaultLanguage:'de-DE'// sets default language for all supported endpoints
    );
    final result = await tmdbWithCustomLogs.v3.search.queryMovies(title);
    return processResult(result);
  }

  Future<List<Movie>> processResult(Map result) async{
    final favorites = (await SharedPreferences.getInstance()).getFavorites();
    final movies = List<Movie>.empty(growable: true);
    if(result.isEmpty || !result.containsKey("results")) {
      return movies;
    }
    final movieResults = result["results"] as List;
    for (var element in movieResults) {
      final movie = Movie.fromMap(element);
      movie.isFavorite = favorites.contains(movie);
      movies.add(movie);
    }
    return movies;
  }
}