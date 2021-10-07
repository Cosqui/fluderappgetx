

import 'package:app_getx/models/restaurant.dart';
import 'package:app_getx/provider/restaurant_provider.dart';

import 'package:get/get.dart';

class Controller extends GetxController{

  var restaurantes = <RestaurantModel>[].obs;
 final service = new RestaturantProvider();

  @override
  void onInit(){
    getRestaurantesAlls();
    super.onInit();
  }

  getRestaurantesAlls() async {
    var result = await service.getRestaurantesAlls();

    restaurantes.addAll(result);
  }

}