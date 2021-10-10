

import 'package:app_getx/controller/controller.dart';
import 'package:app_getx/models/restaurant.dart';
import 'package:app_getx/pages/restaurante_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsRestaurante extends StatelessWidget{
  dynamic args = Get.arguments;

  @override
 
  Widget build(BuildContext context) {
    RestaurantModel instance = args[0]['restaurante'];
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate([
              
              SizedBox(height: 10.0),
               _cardReviews(context,instance)
              // 
              
            ]),
          )
        ],
      ),
    );
  }

 Widget _crearAppBar(BuildContext context) {

   RestaurantModel instance = args[0]['restaurante'];
   return SliverAppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), 
          onPressed: (){
            Get.to(()=> RestaurantePage());
      }),
      elevation: 2.0,
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      flexibleSpace: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.network(instance.logo,
            fit:BoxFit.cover,))
        ],)
   );
 }

Widget _cardReviews(BuildContext context, RestaurantModel instance) {

  return Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: instance.reviews.length,
              itemBuilder: (BuildContext context, int i) {
                return _crearCard(context, instance.reviews[i]);
              }
          
          )
  );
  
}

  Widget _crearCard(BuildContext context, review) {

    return Container(
                width: 200.0,
                child:  GestureDetector(
                  child:Padding(
                    padding:const EdgeInsets.all(8.0),
                    child:Card(
                      //color: ,
                      child:Container(
                        width: 200.0,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:const <Widget>[
                                  Icon( Icons.reviews, color: Colors.black, size: 40.0,),
                                 
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    child:const Text("Comentarios:", style: TextStyle(color: Colors.grey,fontSize: 14.0),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    child: Text('${review['comments']}', style: TextStyle(fontSize: 14.0),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    child: Text('Email: ${review['email']}', style: TextStyle(color: Colors.blue,fontSize: 14.0),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    child: RichText(
                                            text: TextSpan(
                                              children: [
                                              
                                                WidgetSpan(
                                                  child: Icon(Icons.star_outlined,color: Colors.yellow, size: 14),
                                                ),
                                                TextSpan(
                                                  text: "${review['rating']}",
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ],
                                            ),
)

                                  ),
                                
                              ]
                              ),
                            )
                          ],
                        )
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      
                    ),
                  ),
                  onTap: (){
                      
                     // Navigator.pushNamed(context, 'Listacondicionestabs', arguments: equipo);
                    
                  },
                
                )
              
              );
  }





}