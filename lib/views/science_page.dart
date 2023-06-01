import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newstoday/commen/resposive_size.dart';

import '../controller/home_controller.dart';

// ignore: must_be_immutable
class MyScience extends StatelessWidget {
  MyScience({super.key});
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // homeController.getAnyNews("science");

    return Scaffold(
      // backgroundColor: Colors.blueGrey.shade900,
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: Colors.blueGrey.shade900,
      //   title: const Text('News Now - Science News'),
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
                        Container(
                          height: ScreenSize.sH(context) * (220 / ScreenSize.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(homeController
                                    .scienceNewsDatas!.data[index].imageUrl
                                    .toString()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: ScreenSize.sW(context) *
                                      (5 / ScreenSize.w),
                                ),
                                Text(
                                  homeController.allNewsDatas!.data[index].time,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.sH(context) * (5 / ScreenSize.h),
                        ),
                        Text(
                          homeController.scienceNewsDatas!.data[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  ScreenSize.sW(context) * (20 / ScreenSize.w)),
                        ),
                        SizedBox(
                          height: ScreenSize.sH(context) * (8 / ScreenSize.h),
                          //8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    homeController
                                        .scienceNewsDatas!.data[index].author,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: ScreenSize.sW(context) *
                                          (14 / ScreenSize.w),
                                      // 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: ScreenSize.sW(context) *
                                        (5 / ScreenSize.w),
                                    // 5,
                                  ),
                                  const Icon(
                                    Icons.verified_rounded,
                                    color: Colors.blue,
                                    size: 22,
                                  )
                                ],
                              ),
                            ),
                            Text(homeController
                                .scienceNewsDatas!.data[index].date
                                .toString())
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.sH(context) * (8 / ScreenSize.h),
                          // 8.0,
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          homeController.scienceNewsDatas!.data[index].content
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
                itemCount: homeController.scienceNewsDatas!.data.length,
                // itemCount: homeController.scienceNewsDatas!.data.length,
              ),
      ),
    );
  }
}
