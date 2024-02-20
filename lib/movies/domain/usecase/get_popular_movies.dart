import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';
import 'package:movies_app/movies/domain/repository/movies_base_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movies>,NoParameter >{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  
  @override
  Future<Either<Failure, List<Movies>>> call(NoParameter parameter)  async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
