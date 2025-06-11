import 'dart:convert';

class Movie {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json["adult"],
    backdropPath: json["backdrop_path"] ?? 'nobara.jpg',
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage: " es ",
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"] ?? 'nobara.jpg',
    releaseDate: DateTime.parse(json["release_date"]),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );
  
  get getPosterPath {
    if (posterPath == null) {
      return 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png';
    }
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  get getBackdropPath {
    return 'https://image.tmdb.org/t/p/w500$backdropPath';
  }

  // Map<String, dynamic> toJson() => {
  //   "adult": adult,
  //   "backdrop_path": backdropPath,
  //   "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
  //   "id": id,
  //   "original_language": " es ",
  //   "original_title": originalTitle,
  //   "overview": overview,
  //   "popularity": popularity,
  //   "poster_path": posterPath,
  //   "release_date":
  //       "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
  //   "title": title,
  //   "video": video,
  //   "vote_average": voteAverage,
  //   "vote_count": voteCount,
  // };
}
