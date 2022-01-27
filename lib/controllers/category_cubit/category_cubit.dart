import 'package:bloc/bloc.dart';
import 'package:final_project/models/category.dart';
import 'package:final_project/models/home_models/product.dart';
import 'package:final_project/shared/network/dio_helper.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> with DioHelper{
  CategoryCubit() : super(CategoryInitial());

  List<Category> categories = [];
  bool loading = false;

  Map<int,List<Product>> productsByCategory={};
  Map<int,bool> loadingProductByCategory ={};

  getCategoriesFromApi()async{
    loading = true;
    emit(CategoryLoadingState());
    categories= [];

    await getData(url: 'categories',).then((value) {
      List responseCategories = value.data["data"]["data"];
      if(responseCategories.isNotEmpty){
        responseCategories.forEach((element) {
          categories.add(Category.fromJson(element));
        });
      }else{
        categories = [];
      }

      loading = false;
      emit(CategorySuccessState());
    }).catchError((e){
      print(e.toString());
      loading = false;
      emit(CategoryErrorState(error: e.toString()));
    });
  }
  
  
  
  getProductByCatFromApi({required int id})async{
    if(productsByCategory.containsKey(id)){
      return;
    }
    loadingProductByCategory[id] = true;
    emit(CategoryDetailsLoadingState());
    productsByCategory[id]=[];
    await getData(url: 'categories/$id',).then((value) {
      List responseProductByCategory = value.data["data"]["data"];
      if(responseProductByCategory.isNotEmpty){
        responseProductByCategory.forEach((element) {
          productsByCategory[id]!.add(Product.fromJson(element));
        });
      }else{
        productsByCategory[id] = [];
      }
      loadingProductByCategory[id] = false;
      emit(CategoryDetailsSuccessState());
    }).catchError((e){
      print(e.toString());
      loadingProductByCategory[id] = false;
      emit(CategoryDetailsErrorState(error: e.toString()));
    });
  }
}
