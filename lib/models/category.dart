
class Category{
  int? id;
  String? name;
  String? image;

  Category.fromJson(Map json){
    id = json["id"]??0;
    name = json["name"]??"";
    image = json["image"]??"https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg";
  }
}