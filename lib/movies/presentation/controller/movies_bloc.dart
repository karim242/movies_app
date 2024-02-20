import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utiles/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  MoviesBloc(
    this.getTopRatedMoviesUseCase, 
    this.getPopularMoviesUseCase,
      this.getNowPlayingMoviesUseCase,
      )
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlaying);
    on<GetPopularMoviesEvent>(_getPopular);

    on<GetTopRatedMoviesEvent>(_getTopRated);
  }

  FutureOr<void> _getTopRated(event, emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameter() );

    result.fold(
        (left) => emit(
              state.copyWith(
                  topRatedState: RequestState.error,
                  topRatedMessage: left.message),
            ), (right) {
      emit(
        state.copyWith(
          topRatedMovies: right,
          topRatedState: RequestState.loaded,
        ),
      );
    });
  }

  FutureOr<void> _getPopular(event, emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());

    result.fold(
        (left) => emit(
              state.copyWith(
                  popularState: RequestState.error,
                  popularMessage: left.message),
            ), (right) {
      emit(
        state.copyWith(
          popularMovies: right,
          popularState: RequestState.loaded,
        ),
      );
    });
  }

  FutureOr<void> _getNowPlaying(event, emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameter());

    result.fold(
        (left) => emit(
              state.copyWith(
                  nowPlayingState: RequestState.error,
                  nowPlayingMessage: left.message),
            ), (right) {
      emit(
        state.copyWith(
          nowPlayingMovies: right,
          nowPlayingState: RequestState.loaded,
        ),
      );
    });
  }
}
