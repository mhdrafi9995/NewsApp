import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newstoday/commen/resposive_size.dart';
import 'package:newstoday/views/home_Page.dart';
import 'package:newstoday/views/search_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _navIndex = 0;

  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _navIndex = value;
          });
        },
        children: [
          HomePage(),
          MySearch(),
          HomePage(),
          HomePage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _navIndex = 0;
                });
                _pageController.animateToPage(
                  0,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(
                Icons.home,
                size: ScreenSize.sH(context) * (28 / ScreenSize.h),
                color: _navIndex == 0 ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _navIndex = 1;
                });
                _pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(
                CupertinoIcons.search,
                size: ScreenSize.sH(context) * (28 / ScreenSize.h),
                color: _navIndex == 1 ? Colors.black : Colors.grey,
              ),
            ),
            //34
            IconButton(
              onPressed: () {
                setState(() {
                  _navIndex = 2;
                });
                _pageController.animateToPage(
                  2,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(
                Icons.bookmark_border_outlined,
                size: ScreenSize.sH(context) * (28 / ScreenSize.h),
                color: _navIndex == 2 ? Colors.black : Colors.grey,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  _navIndex = 3;
                });
                _pageController.animateToPage(
                  3,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              icon: Icon(
                Icons.settings,
                size: ScreenSize.sH(context) * (28 / ScreenSize.h),
                color: _navIndex == 3 ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
