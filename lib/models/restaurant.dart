class Restaurante{
  List<RestaurantModel> items =  [];
  Restaurante();
   Restaurante.fromJsonList(List<dynamic> jsonList){
  
   

    for (var item in jsonList){
      final rest = RestaurantModel.fromJson(item);
      items.add(rest);
    }
  }
}


class RestaurantModel{
  String slug;
  String name;
  String description;
  String logo;
  double rating;
  List<dynamic> reviews;
 // List<dynamic> food_type;


  RestaurantModel({
    required this.slug,
    required this.name,
    required this.description,
    required this.logo,
    required this.rating,
    required this.reviews
    //required this.food_type,
  });

  Map<String,dynamic> toJson(){
     var map = <String,dynamic>{
       "slug":slug,
       "name":name,
       "description":description,
       "logo":logo,
       "rating":rating,
       "reviews":reviews
       //"food_type":food_type
     };
     
      return map;
  }
factory RestaurantModel.fromJson(Map<String, dynamic>  json) =>  RestaurantModel(
    slug        : json['slug'],
    name       : json['name'],
    description   : json['description'],
    logo  : json['logo'],
    rating  : json['rating'],
    reviews: json['reviews']
   // food_type: json['food_type'],
  
  ); 

  

  

}

