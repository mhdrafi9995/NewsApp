import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstoday/commen/resposive_size.dart';
import '../controller/home_controller.dart';
import 'new_data_details.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ,
      // backgroundColor: Colors.blueGrey.shade900,
      body: GetBuilder<HomeController>(
        builder: (controller) => homeController.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: homeController.allNewsDatas!.data.length,
                // itemCount: homeController.allNewsDatas!.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(NewsPage(
                              newsid:
                                  homeController.allNewsDatas!.data[index].id,
                            ));
                          },
                          child: Container(
                            height:
                                ScreenSize.sH(context) * (220 / ScreenSize.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(homeController
                                      .allNewsDatas!.data[index].imageUrl
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
                                    homeController
                                        .allNewsDatas!.data[index].time,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.sH(context) * (10 / ScreenSize.h),
                        ),
                        Text(
                          homeController.allNewsDatas!.data[index].title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  ScreenSize.sW(context) * (18 / ScreenSize.w)),
                        ),
                        const SizedBox(
                          height: 8.0,
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
                                        .allNewsDatas!.data[index].author,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: ScreenSize.sW(context) *
                                            (14 / ScreenSize.w)),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.verified_rounded,
                                    color: Colors.blue,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              homeController.allNewsDatas!.data[index].date
                                  .toString(),
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.sH(context) * (8 / ScreenSize.h),
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          homeController.allNewsDatas!.data[index].content
                              .toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize:
                                ScreenSize.sW(context) * (16 / ScreenSize.w),
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
      ),
    );
  }
}
