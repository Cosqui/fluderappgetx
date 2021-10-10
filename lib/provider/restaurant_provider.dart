
import 'dart:async';
import 'package:app_getx/models/restaurant.dart';
import 'package:http/http.dart' as http;


import 'dart:convert' as convert;


class RestaturantProvider {
  

  Future <List<RestaurantModel>> getRestaurantesAlls () async {
   
     
       final response = await http.get(Uri.parse("https://tellurium.behuns.com/api/restaurants/"));
   
      final List<dynamic>  decodedata =  convert.jsonDecode(response.body);
      
      return decodedata.map((e) => 
      RestaurantModel.fromJson(e)).toList();
       
     
      
      
  }
      
     
   

  }
