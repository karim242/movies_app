import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entites/genre.dart';

class MoviesDetails extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<Genres> genres;

  const MoviesDetails(
      {required this.id,
      required this.genres,
      required this.title,
      required this.backdropPath,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate,
      required this.runtime,});

  @override
  List<Object?> get props => [
        id,
        genres,
        title,
        backdropPath,
        overview,
        voteAverage,
        releaseDate,
        runtime,
      ];
}
