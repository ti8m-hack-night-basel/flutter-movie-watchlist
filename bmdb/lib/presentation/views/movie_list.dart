import 'package:bmdb/domain/models/movie.dart';
import 'package:bmdb/presentation/views/movie_card.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie movie)? onMovieFavoriteTap;

  const MovieList({super.key, required this.movies, this.onMovieFavoriteTap});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Center(
        child: Text("Keine Filme vorhanden"),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MovieCard(movies[index], onMovieFavoriteTap);
        },
        itemCount: movies.length,
      ),
    );
  }
}
