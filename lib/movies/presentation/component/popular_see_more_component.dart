import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/movies/domain/entites/movies.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import 'package:movies_app/movies/presentation/views/7.2%20movie_detail_screen.dart';

class SeeMoreComponent extends StatelessWidget {
  const SeeMoreComponent({super.key, required this.popularMovies});
  final Movies popularMovies;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return MovieDetailScreen(
            id: popularMovies.id,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                width: 120.0,
                height: 140.0,
                fit: BoxFit.cover,
                imageUrl: ApiConstance.imageUrl(popularMovies.backdropPath),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(popularMovies.title,
                          //state.movieDetail!.title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          )),
                      const SizedBox(height: 8.0),
                      Row(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            popularMovies.releaseDate.split('-')[0],
                            // state.movieDetail!.releaseDate.split('-')[0],
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              (popularMovies.voteAverage).toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ]),
                      Text(
                        popularMovies.overview,
                        maxLines: 3,
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
