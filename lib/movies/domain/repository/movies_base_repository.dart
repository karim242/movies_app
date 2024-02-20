import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';
import 'package:movies_app/movies/domain/entites/movies_datails.dart';
import 'package:movies_app/movies/domain/entites/recommendation.dart';
import 'package:movies_app/movies/domain/usecase/get_movies_details.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetails>> getMoviesDetails(MovieDetailsParameter parameter);

  Future<Either<Failure, List<Recommendation>>> getRecommenation(RecommendationParameters parameter);

}
