

class Product{
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String> images = [];
  bool? inFavorites;
  bool? inCart;

  Product.fromJson(Map json){
    id = json['id']??0;
    price = double.parse(json["price"].toString());
    oldPrice = double.parse(json["old_price"].toString());
    discount = json['discount']??0.0;
    image = json["image"]??'https://image.freepik.com/free-psd/fast-food-branding-mockup_23-2149179752.jpg';
    name = json['name']??"";
    description = json['description']??"";
    json['images'].forEach((element){
      images.add(element.toString());
    });
    inFavorites = json['in_favorites']??false;
    inCart = json['in_cart']??false;
  }

}
