import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../model/all_news.dart';
import '../model/new_model.dart';
import '../services/all_new_services.dart';

class HomeController extends GetxController {
  HomeController() {
    getAllNews();
    getBusinessNews();
    getScienceNews();
    getSportsNews();
  }
  Services service = Services();

  NewsModel? anyNews;
  NewsModel? allNewsDatas;
  NewsModel? sportsNewsDatas;
  NewsModel? businessNewsDatas;
  NewsModel? scienceNewsDatas;
  bool isLoading = false;
  void getAllNews() async {
    isLoading = true;
    update();
    await service.getAllNewsResult().then(
      (value) {
        if (value != null) {
          allNewsDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }

  NewsDataModel findById(String id) {
    return allNewsDatas!.data.firstWhere((element) => element.id == id);
  }

  void getSportsNews() async {
    isLoading = true;
    update();
    await service.getSports().then(
      (value) {
        if (value != null) {
          sportsNewsDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }

  void getBusinessNews() async {
    isLoading = true;
    update();
    await service.getBesiness().then(
      (value) {
        if (value != null) {
          businessNewsDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }

  void getScienceNews() async {
    isLoading = true;
    update();
    await service.getScience().then(
      (value) {
        if (value != null) {
          scienceNewsDatas = value;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
    isLoading = false;
    update();
  }

  TextEditingController searchEditingController = TextEditingController();
  List<NewsDataModel> searchList = [];

  void search(String searchController) {
    List<NewsDataModel> resultList = [];
    if (searchController.isEmpty) {
      resultList = allNewsDatas!.data;
      update();
    } else {
      resultList = allNewsDatas!.data
          .where(
            (element) => element.title.toLowerCase().contains(
                  searchController.toLowerCase(),
                ),
          )
          .toList();
      update();
    }
    searchList = resultList;
    update();
  }

  void getAnyNews(String tabText) async {
    isLoading = true;
    update();
    if (tabText == 'all') {
      anyNews = allNewsDatas;
      update();
    } else if (tabText == 'business') {
      anyNews = businessNewsDatas;
      update();
    } else if (tabText == 'science') {
      anyNews = scienceNewsDatas;
      update();
    } else {
      anyNews = sportsNewsDatas;
      update();
    }
    isLoading = false;
    update();
  }
}
