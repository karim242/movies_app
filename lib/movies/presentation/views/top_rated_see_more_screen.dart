import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utiles/enums.dart';
import 'package:movies_app/movies/presentation/component/top_rated_see_more_component.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class TopRatedSeeMoreScreen extends StatelessWidget {
  const TopRatedSeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      switch (state.topRatedState) {
        case RequestState.loading:
          return const SizedBox(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        case RequestState.loaded:
          return Scaffold(
            appBar: AppBar(
              title: const Text("TopRated Movies"),
            ),
            body: ListView.builder(
              itemCount: state.popularMovies.length,
              itemBuilder: (context, index) {
                return TopRatedSeeMoreComponent(
                  topRatedMovies: state.topRatedMovies[index],
                );
              },
            ),
          );
        case RequestState.error:
          return SizedBox(
            height: 400.0,
            child: Center(child: Text(state.topRatedMessage)),
          );
      }
    });
  }
}
