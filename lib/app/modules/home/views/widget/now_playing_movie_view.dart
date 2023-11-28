import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/home/views/widget/now_playing_movie_detail_view.dart';
import 'package:movie_app/app/routes/app_pages.dart';

import '../../controllers/home_controller.dart';

class NowPlayingMovieView extends GetView<HomeController> {
  const NowPlayingMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Container(
              height: 40,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  if (value == "") {
                    controller.tempNowPlayingMovieList.value =
                        controller.nowPlayingMovieList;
                  } else {
                    controller.tempNowPlayingMovieList.value =
                        controller.searchNowPlayMovie(
                            controller.nowPlayingMovieList, value);
                  }
                },
              ),
            ),
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.tempNowPlayingMovieList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Get.to(NowPlayingMovieDetailView(
                              nowPlayingMovieList:
                                  controller.tempNowPlayingMovieList[index]));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w342${controller.tempNowPlayingMovieList[index].posterPath}",
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .tempNowPlayingMovieList[index].title
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        controller
                                            .tempNowPlayingMovieList[index]
                                            .overview
                                            .toString(),
                                        maxLines: 4,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
        ));
  }
}
