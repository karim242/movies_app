import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entites/movies_datails.dart';
import 'package:movies_app/movies/domain/repository/movies_base_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MoviesDetails,MovieDetailsParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUseCase(this.baseMoviesRepository,);

  @override
  Future<Either<Failure, MoviesDetails>> call(MovieDetailsParameter parameter) async {
    return await baseMoviesRepository.getMoviesDetails(parameter);
  }
}

class MovieDetailsParameter extends Equatable{
  final int movieId;

  const MovieDetailsParameter({required this.movieId});
  
  @override
  List<Object?> get props => [movieId];
}