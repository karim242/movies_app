import 'package:flutter/material.dart';
import 'package:movies_app/core/utiles/app_string.dart';
import 'package:movies_app/movies/presentation/component/now_playing_movies_component.dart';
import 'package:movies_app/movies/presentation/component/popular_movies_component.dart';
import 'package:movies_app/movies/presentation/component/row_component.dart';
import 'package:movies_app/movies/presentation/component/top_rated_component.dart';
import 'package:movies_app/movies/presentation/views/popular_see_more_screen.dart';
import 'package:movies_app/movies/presentation/views/top_rated_see_more_screen.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingComponent(),
            RowComponent(
              title: AppString.popular,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PopularSeeMoreScreen();
                }));
              },
            ),
            const PopularComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: RowComponent(
                  title: AppString.topRated,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const TopRatedSeeMoreScreen();
                    }));
                  }),
            ),
            const TopRatedComponent(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
