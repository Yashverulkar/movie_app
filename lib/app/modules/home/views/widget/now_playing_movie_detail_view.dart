import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/app/modules/home/model/now_playing_movie_model.dart';

class NowPlayingMovieDetailView extends StatelessWidget {
  final NowPlayingMovieList nowPlayingMovieList;
  const NowPlayingMovieDetailView(
      {super.key, required this.nowPlayingMovieList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.network(
          "https://image.tmdb.org/t/p/original${nowPlayingMovieList.backdropPath!}",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.7)),
                  height: 300,
                  width: MediaQuery.of(context).size.width - 20,
                  // margin: const EdgeInsets.symmetric(
                  //   horizontal: 10,
                  //   vertical: 10,
                  // ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nowPlayingMovieList.title!,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        nowPlayingMovieList.releaseDate.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        nowPlayingMovieList.overview.toString(),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
