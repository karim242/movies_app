import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movies_remot_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/movies_base_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movies_details.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc.dart';

final sl = GetIt.instance;

class ServeivesLocator {
  void init() {
    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() =>  MovieDetailsBloc(sl(),sl()));


    ///UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));


    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseRemotDataSource: sl()));

    ///Data Source
    sl.registerLazySingleton<BaseRemotDataSource>(() => RemoteDataSource());
  }
}
