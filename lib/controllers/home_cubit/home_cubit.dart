import 'package:bloc/bloc.dart';
import 'package:final_project/models/home_models/banner_model.dart';
import 'package:final_project/models/home_models/product.dart';
import 'package:final_project/shared/network/dio_helper.dart';
import 'package:flutter/foundation.dart';



part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with DioHelper{
  HomeCubit() : super(HomeInitial());
  List<Banner> banners = [];
  List<Product> products = [];
  String ad = "";
  bool loading = false;

  getHomeDataFromApi()async{
    loading = true;
    emit(HomeDataLoadingState());
    banners = [];
    products= [];
    await getData(url: 'home',).then((value) {
     ad = value.data['data']['ad']??"https://image.freepik.com/free-psd/fast-food-branding-mockup_23-2149179752.jpg";
      List responseBanners = value.data["data"]['banners'];
      if(responseBanners.isNotEmpty){
        responseBanners.forEach((element) {
          banners.add(Banner.fromJson(element));
        });
      }else{
        banners = [];
      }

      List responseProducts = value.data['data']['products'];
      if(responseProducts.isNotEmpty){
        responseProducts.forEach((element) {
          products.add(Product.fromJson(element));
        });
      }else{
        products= [];
      }
      loading = false;
      emit(HomeDataSuccessState());
    }).catchError((e){
      print(e.toString());
      loading = false;
      emit(HomeDataErrorState(error: e.toString()));
    });
  }
}
