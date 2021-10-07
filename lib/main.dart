
import 'package:app_getx/pages/restaurante_page.dart';
import 'package:app_getx/pages/restautante_reviews.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restaurantes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
   
      initialRoute: '/',
      getPages: [
           GetPage(name: '/', page: () => const RestaurantePage()),
           GetPage(name: 'reviews', page: () => ReviewsRestaurante()),
      ],
    );
  }
}

