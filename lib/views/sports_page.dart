import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'new_data_details.dart';

// ignore: must_be_immutable
class MySports extends StatelessWidget {
  MySports({super.key});
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // homeController.getAnyNews("sports");

    return Scaffold(
      // backgroundColor: Colors.blueGrey.shade900,
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: Colors.blueGrey.shade900,
      //   title: const Text('News Now - Sports News'),
      // ),
      // drawer: Drawer(),
      body: GetBuilder<HomeController>(
        builder: (controller) => homeController.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(NewsPage(
                              newsid: homeController
                                  .sportsNewsDatas!.data[index].id,
                            ));
                          },
                          child: Container(
                            height: 220.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(homeController
                                      .sportsNewsDatas!.data[index].imageUrl
                                      .toString()),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          homeController.sportsNewsDatas!.data[index].title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  homeController
                                      .sportsNewsDatas!.data[index].author,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.verified_rounded,
                                  color: Colors.blue,
                                  size: 22,
                                ),
                              ],
                            ),
                            Text(homeController
                                .sportsNewsDatas!.data[index].date
                                .toString())
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          homeController.sportsNewsDatas!.data[index].content
                              .toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: homeController.sportsNewsDatas!.data.length,
              ),
      ),
    );
  }
}
