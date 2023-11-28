import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/app/modules/home/views/widget/now_playing_movie_view.dart';
import 'package:movie_app/app/modules/home/views/widget/top_rated_move_view.dart';
import 'package:movie_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Define your screens here
    final List<Widget> _screens = [
      NowPlayingMovieView(),
      TopRatedMovieView(),
    ];
    return Obx(
      () => Scaffold(
        body: _screens[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.currentIndex.value = index;
            if (index == 0) {
              controller.getNowPlaying();
            } else {
              controller.getTopRatede();
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined),
              label: 'Now Playing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Top Rated',
            ),
          ],
        ),
      ),
    );
  }
}

