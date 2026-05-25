class MovieDetailsModel {
  int id;
  String title;
  String overview;
  String posterPath;
  String backdropPath;
  double voteAverage;
  String releaseDate;

  static const String _imageBase = 'https://image.tmdb.org/t/p/w500';
  static const String _backdropBase = 'https://image.tmdb.org/t/p/w780';

  String get posterUrl => '$_imageBase$posterPath';
  String get backdropUrl => '$_backdropBase$backdropPath';

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
