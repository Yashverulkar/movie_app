import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/home/views/widget/top_rated_movie_detail_view.dart';

import '../../controllers/home_controller.dart';

class TopRatedMovieView extends GetView<HomeController> {
  const TopRatedMovieView({super.key});

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
                    controller.tempTopRatedMovieList.value =
                        controller.topRatedMovieList;
                  } else {
                    controller.tempTopRatedMovieList.value =
                        controller.searchTopRatedMovie(
                            controller.topRatedMovieList, value);
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
                  itemCount: controller.tempTopRatedMovieList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(TopRatedMovieDetailView(
                          topRatedMovieList:
                              controller.tempTopRatedMovieList[index],
                        ));
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
                                "https://image.tmdb.org/t/p/w342${controller.tempTopRatedMovieList[index].posterPath}",
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
                                        .tempTopRatedMovieList[index].title
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      controller
                                          .tempTopRatedMovieList[index].overview
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
                      ),
                    );
                  }),
        ));
  }
}
