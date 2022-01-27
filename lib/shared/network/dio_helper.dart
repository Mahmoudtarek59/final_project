import 'package:dio/dio.dart';
import 'package:final_project/shared/constants.dart';

mixin DioHelper {
  late Dio dio;

  dioInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: api,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  Future<Response> getData({required String url,Map<String,dynamic>? queryParameters})async{
    dioInit();
    return await dio.get(url,queryParameters: queryParameters,);
  }

  postData({required String url,Map<String,dynamic>? queryParameters,Map<String,dynamic>? body})async{
    dioInit();
    return await dio.post(url,queryParameters: queryParameters,data: body);
  }
}
