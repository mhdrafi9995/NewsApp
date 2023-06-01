import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstoday/commen/resposive_size.dart';
import 'package:newstoday/views/all_news.dart';
import 'package:newstoday/views/science_page.dart';
import 'package:newstoday/views/sports_page.dart';

import '../controller/home_controller.dart';
import 'business_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  int tabIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News ",
              style: TextStyle(
                  fontSize: ScreenSize.sW(context) * (22 / ScreenSize.w),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Today ",
              style: TextStyle(
                  fontSize: ScreenSize.sW(context) * (22 / ScreenSize.w),
                  fontWeight: FontWeight.w500,
                  color: Colors.red),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Badge(
                backgroundColor: Colors.red,
                label: Text("3"),
                child: Icon(
                  Icons.notifications_none,
                  size: ScreenSize.sW(context) * (32 / ScreenSize.w),
                ),
              )),
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(ScreenSize.sH(context) * (60 / ScreenSize.h)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.sW(context) * (4 / ScreenSize.w),
                  vertical: ScreenSize.sH(context) * (4 / ScreenSize.h),
                  //4
                ),
              ),
              CupertinoTabBar(
                activeColor: Colors.red,
                inactiveColor: Colors.black,
                onTap: (value) {
                  setState(() {
                    tabIndex = value;
                  });
                  _pageController.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                currentIndex: tabIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Text(
                      'All',
                      style: TextStyle(
                        fontSize: ScreenSize.sW(context) * (16 / ScreenSize.w),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Text(
                      'Science',
                      style: TextStyle(
                        fontSize: ScreenSize.sW(context) * (16 / ScreenSize.w),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Text(
                      'Business',
                      style: TextStyle(
                        fontSize: ScreenSize.sW(context) * (16 / ScreenSize.w),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Text(
                      'Sports',
                      style: TextStyle(
                        fontSize: ScreenSize.sW(context) * (16 / ScreenSize.w),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            tabIndex = value;
          });
        },
        children: [
          AllNews(),
          MyBusiness(),
          MyScience(),
          MySports(),
        ],
      ),
    );
  }
}
