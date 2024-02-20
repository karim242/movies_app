import 'package:movies_app/movies/data/model/geners_model.dart';
import 'package:movies_app/movies/domain/entites/movies_datails.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel({
    required super.id,
    required super.genres,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.runtime,
  });

  factory MoviesDetailsModel.fromjson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
       runtime: json["runtime"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"],
        genres:List<GenersModel>.from(json["genres"].map((x) => GenersModel.fromjson(x))),
      );
}
