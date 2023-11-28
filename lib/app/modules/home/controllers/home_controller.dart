import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/app/modules/home/model/now_playing_movie_model.dart';
import 'package:movie_app/app/modules/home/model/top_rated_movie_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await getNowPlaying();
    super.onInit();
  }

  var client = http.Client();
  //TODO: Implement HomeController

  var currentIndex = 0.obs;
  var isLoading = false.obs;
  var nowPlayingMovieList = <NowPlayingMovieList>[].obs;
  var tempNowPlayingMovieList = <NowPlayingMovieList>[].obs;

  getNowPlaying() async {
    isLoading.value = true;
    try {
      var response = await client.get(
        Uri.parse(
            "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"),
      );
      print(response);
      NowPlayingMovieModel nowPlayingMovieModel =
          nowPlayingMovieModelFromJson(response.body);

      nowPlayingMovieList.value = nowPlayingMovieModel.results!;
      tempNowPlayingMovieList.value = nowPlayingMovieList;

           isLoading.value = false;

      isLoading.value = false;
    } finally {
            isLoading.value = false;
    }
  }

  var topRatedMovieList = <TopRatedMovieList>[].obs;
  var tempTopRatedMovieList = <TopRatedMovieList>[].obs;
  getTopRatede() async {
    isLoading.value = true;
    try {
      var response = await client.get(
        Uri.parse(
            "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"),
      );

      TopRatedMovieModel topRatedMovieModel =
          topRatedMovieModelFromJson(response.body);

      topRatedMovieList.value = topRatedMovieModel.results!;
      tempTopRatedMovieList.value = topRatedMovieList;
      isLoading.value = false;
    } finally {
            isLoading.value = false;
    }
  }

  List<NowPlayingMovieList> searchNowPlayMovie(
      List<NowPlayingMovieList> movies, String searchTitle) {
    final String searchLowerCase = searchTitle.toLowerCase();
    List<NowPlayingMovieList> searchResults = movies
        .where((movie) => movie.title!.toLowerCase().contains(searchLowerCase))
        .toList();
    return searchResults;
  }

  List<TopRatedMovieList> searchTopRatedMovie(
      List<TopRatedMovieList> movies, String searchTitle) {
    final String searchLowerCase = searchTitle.toLowerCase();
    List<TopRatedMovieList> searchResults = movies
        .where((movie) => movie.title!.toLowerCase().contains(searchLowerCase))
        .toList();
    return searchResults;
  }
}
