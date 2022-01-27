

class Banner{
  int? id;
  String? image;
  String? category;
  String? product;

  Banner.fromJson(Map json){
    id = json['id']??0;
    image = json["image"]??"https://image.freepik.com/free-psd/fast-food-branding-mockup_23-2149179752.jpg";
    category = json["category"]??"0";
    product = json["product"]??"0";
  }
}