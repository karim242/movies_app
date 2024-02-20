import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_mes_model.dart';
import 'package:movies_app/movies/data/model/movies_details_model.dart';
import 'package:movies_app/movies/data/model/movies_model.dart';
import 'package:movies_app/movies/data/model/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecase/get_movies_details.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation.dart';

abstract class BaseRemotDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MoviesDetailsModel> getMovieDetails(MovieDetailsParameter parameters);
  Future<List<RecommendationModel>>getMovieRecommendation (RecommendationParameters parameters);

}

class RemoteDataSource implements BaseRemotDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<MoviesDetailsModel> getMovieDetails(MovieDetailsParameter parameters)  async {
    final response = await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MoviesDetailsModel.fromjson(response.data);
      
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }
  
  @override
  Future<List<RecommendationModel>> getMovieRecommendation(RecommendationParameters parameters)  async {
    final response = await Dio().get(ApiConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List).map(
        (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
