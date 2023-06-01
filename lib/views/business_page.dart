import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newstoday/commen/resposive_size.dart';

import '../controller/home_controller.dart';

// ignore: must_be_immutable
class MyBusiness extends StatelessWidget {
  MyBusiness({super.key});
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // homeController.getAnyNews("business");

    return Scaffold(
      // backgroundColor: Colors.blueGrey.shade900,
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: Colors.blueGrey.shade900,
      //   title: const Text('News Now - Business News'),
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
                                    .businessNewsDatas!.data[index].imageUrl
                                    .toString()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.sW(context) * (10 / ScreenSize.h),
                        ),
                        Text(
                          homeController.businessNewsDatas!.data[index].title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  ScreenSize.sW(context) * (20 / ScreenSize.w)),
                        ),
                        SizedBox(
                          height: ScreenSize.sH(context) * (5 / ScreenSize.h),
                        ),
                        Row(
                          children: [
                            Text(
                              homeController
                                  .businessNewsDatas!.data[index].author,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: ScreenSize.sW(context) *
                                    (14 / ScreenSize.w),
                              ),
                            ),
                            SizedBox(
                              width:
                                  ScreenSize.sW(context) * (5 / ScreenSize.w),
                            ),
                            const Icon(
                              Icons.verified_rounded,
                              color: Colors.blue,
                              size: 22,
                            ),
                            SizedBox(
                              width:
                                  ScreenSize.sW(context) * (48 / ScreenSize.w),
                            ),
                            Text(homeController
                                .businessNewsDatas!.data[index].date
                                .toString())
                          ],
                        ),
                        SizedBox(
                          height: ScreenSize.sH(context) * (8 / ScreenSize.h),
                          //8
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          homeController.businessNewsDatas!.data[index].content
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  ScreenSize.sW(context) * (16 / ScreenSize.w)),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: homeController.businessNewsDatas!.data.length,
              ),
      ),
    );
  }
}
