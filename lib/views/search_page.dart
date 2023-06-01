import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'new_data_details.dart';

// ignore: must_be_immutable
class MySearch extends StatelessWidget {
  MySearch({super.key});
  double width = Get.width;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('Search News'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<HomeController>(
            builder: (controller) => ListView(
              children: [
                Container(
                  height: 50,
                  child: CupertinoSearchTextField(
                    style: TextStyle(color: Colors.white),
                    controller: homeController.searchEditingController,
                    backgroundColor: Colors.grey[500],
                    autofocus: true,
                    onChanged: (value) {
                      homeController.search(
                          homeController.searchEditingController.text.trim());
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                NewsPage(
                                  newsid: homeController.searchList[index].id,
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(homeController
                                            .searchList[index].imageUrl
                                            .toString()),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: width * 0.54,
                                  child: Text(
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    homeController.searchList[index].title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${homeController.searchList[index].author}",
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(homeController.searchList[index].date
                                  .toString())
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          // Text(
                          //   textAlign: TextAlign.justify,
                          //   homeController.searchList[index].content.toString(),
                          //   style: const TextStyle(
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 16.0,
                          //   ),
                          // )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: homeController.searchList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
