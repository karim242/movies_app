import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/movies/data/datasource/movies_remot_data_source.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';
import 'package:movies_app/movies/domain/entites/movies_datails.dart';
import 'package:movies_app/movies/domain/entites/recommendation.dart';
import 'package:movies_app/movies/domain/repository/movies_base_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movies_details.dart';

import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation.dart';

import '../../../core/error/failure.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseRemotDataSource baseRemotDataSource;

  MoviesRepository( {required this.baseRemotDataSource});

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseRemotDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseRemotDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseRemotDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
    Future<Either<Failure, MoviesDetails>> getMoviesDetails(MovieDetailsParameter parameter) async {
    final result = await baseRemotDataSource.getMovieDetails(parameter);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommenation(RecommendationParameters parameter) async{
     final result = await baseRemotDataSource.getMovieRecommendation(parameter);
    try {
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
