
import 'package:app_getx/controller/controller.dart';
import 'package:app_getx/pages/restautante_reviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantePage extends StatelessWidget {
  const RestaurantePage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {

 var controller = Get.put(Controller());
 
 return Scaffold(
     appBar: AppBar(
        //backgroundColor: Color.fromRGBO(179, 27, 19, 1),
        centerTitle: true,
        title: Text('Lista de Restaurantes'),
        actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
                           
            },
        ),
    
      ],
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
              padding:  EdgeInsets.only(bottom:100.0, top: 15.0, right: 15.0, left: 15.0),
           
              itemCount: controller.restaurantes.length,
              itemBuilder: (BuildContext context, int i) {
                return _crearCardsRestaurantes( context ,controller.restaurantes[i]);
              } 
            ),
       
        )
      ],
    )
    )
    );
  }

Widget  _crearCardsRestaurantes(BuildContext context,dynamic item) {
  return Center(
    child: Card(
      child: Column(
        children: [
          ListTile(
             leading: CircleAvatar(
              radius: 30.0,
                  backgroundImage: NetworkImage(item.logo),
            ),
            title: Text('${item.name}'),
            subtitle: Text('${item.description}'),
            trailing: Icon(Icons.arrow_forward_ios ,color: Colors.black),
            onTap: (){
          
              Get.to(() => ReviewsRestaurante(),arguments: [{"restaurante": item},]);
             
            }
          ),
        ],
      ),
    ),
  );
}
}

