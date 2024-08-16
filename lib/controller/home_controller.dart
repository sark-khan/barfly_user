import 'package:barfly_user/services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:barfly_user/models/getEntities.dart';
import 'package:barfly_user/return_obj.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  // final String searchTerm;

  var isSearchActive = false.obs;
  var isLoading = true.obs;
  var isFavourite = false.obs;
  var starIcon = Icons.star_outline_sharp.obs;
  var entityStarIcons = <String, Rx<IconData>>{}.obs;
  var favoritesFontSize = 15.00.obs;
  var mostPopularFontSize = 40.00.obs;
  var ongoingEvents = <Entity>[].obs;
  var remainingEvents = <Entity>[].obs;
  HomeController();

  void toggleSearch() {
    isSearchActive.value = isSearchActive.value == true ? false : true;
  }

  void toggleStarIcon(String entityId) async {
    if (entityStarIcons.containsKey(entityId)) {
      var currentIcon = entityStarIcons[entityId]!.value;
      late var response;
      if (currentIcon == Icons.star) {
        response = await Apiservice().addFavourite(entityId, false);
      } else {
        response = await Apiservice().addFavourite(entityId, true);
      }
      if (response.status == true) {
        entityStarIcons[entityId]!.value =
            currentIcon == Icons.star_outline_sharp
                ? Icons.star
                : Icons.star_outline_sharp;
      }
      Fluttertoast.showToast(msg: response["message"]);
    } else {
      entityStarIcons[entityId] = Rx<IconData>(Icons.star_outline_sharp);
    }
  }

  void favouritesButtonPressed() {
    isFavourite.value = true;
    favoritesFontSize.value = 40.00;
    mostPopularFontSize.value = 15.00;
    fetchEntities("", true);
  }

  void mostPopularButtonPressed() {
    isFavourite.value = false;
    favoritesFontSize.value = 15.00;
    mostPopularFontSize.value = 40.00;
    fetchEntities("", false);
  }

  Future<ReturnObj> fetchEntities(
      String searchTerm, bool isFavouriteEntities) async {
    print("reached here in fetch Entities");
    isLoading.value = true;
    print("reached here in fetch Entities  asdsadas");
    var result = isFavourite.value == false
        ? await Apiservice().getEntities(searchTerm, isFavouriteEntities)
        : await Apiservice().getEntities(searchTerm, isFavouriteEntities);
    if (result.status) {
      ongoingEvents.value = result.data!.ongoingEventEntities;
      remainingEvents.value = result.data!.remainingEntities;
      for (var entity in ongoingEvents) {
        if (!entityStarIcons.containsKey(entity.id)) {
          entityStarIcons[entity.id] = Rx<IconData>(
              entity.isFavouriteEntity ? Icons.star : Icons.star_outline_sharp);
        }
      }
      for (var entity in remainingEvents) {
        if (!entityStarIcons.containsKey(entity.id)) {
          print("${entity.isFavouriteEntity} rached erhere");
          entityStarIcons[entity.id] = Rx<IconData>(
              entity.isFavouriteEntity ? Icons.star : Icons.star_outline_sharp);
        }
      }
    } else {
      print("Failed to fetch entities: ${result.message}");
    }
    isLoading.value = false;
    return result;
  }
}
