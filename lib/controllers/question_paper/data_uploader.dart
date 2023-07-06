import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
   void uploadData() async{
    //getting data from folder assets/DB/paper/ so they could be later stored in firebase
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    //load json file
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papersInAssets = manifestMap.keys.where((path) => path.startsWith("assets/DB/paper") 
      && path.contains(".json")).toList();
    //read the content
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      print(stringPaperContent);
    }
  }
}