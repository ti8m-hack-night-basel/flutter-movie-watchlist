import 'package:bmdb/domain/models/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function(Movie movie)? onMovieFavoriteTap;

  const MovieCard(
    this.movie,
    this.onMovieFavoriteTap, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: movie.imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: movie.imageUrl!,
                  )
                : Text(
                    "?",
                    style: TextStyle(fontSize: 64, fontWeight: FontWeight.w600),
                  ),
          ),
          Flexible(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onMovieFavoriteTap != null) {
                            onMovieFavoriteTap!(movie);
                          }
                        },
                        child: Icon(
                          movie.isFavorite ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                      )
                    ],
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: Text(
                      movie.date,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    movie.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
