import 'dart:convert';
import 'dart:ffi';

class Movie
{
  final int id;
  final String title;
  final String description;
  final String date;
  final String? imageUrl;
  bool isFavorite;

  Movie(this.id, this.title, this.description, this.date, this.imageUrl, this.isFavorite);

  factory Movie.fromMap(Map<String, dynamic> map) {
    final titleOrName = map.containsKey("title") ? "title" : "name";
    final date = map.containsKey("release_date") ? "release_date" : "first_air_date";
    final image = map.containsKey("poster_url") ? map["poster_url"] : "https://image.tmdb.org/t/p/w500/${map["poster_path"] as String?}";
    return Movie(
      map["id"] as int,
      map[titleOrName] as String,
      map["overview"] as String,
      map[date] as String,
      image,
      false
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "overview": description,
      "release_date": date,
      "poster_url": imageUrl ?? "",
      "is_favorite": isFavorite,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Movie.fromJson(String json) => Movie.fromMap(jsonDecode(json));

  @override
  bool operator ==(Object other) {
    return  other is Movie && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}