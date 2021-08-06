
import 'package:dio/dio.dart';
import 'package:news_app/service/http_service.dart';

/**
 * Created by sakibul.haque on 19,June,2021
 */

const BASE_URL ="https://newsapi.org/";
const API_KEY = "90e2a6f557e04cb48e4ca7f3d1963e35";

class HttpServiceImpl extends HttpService{

  Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
   try {
     response = await _dio.get(url);
     print(response.data);
     print(response.data);
   } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
   }

   return response;
  }

  initializeInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
        onError: (error){
          print(error.message);
        },
        onRequest: (request){
          print("${request.method} | ${request.path}");
        },
        onResponse: (response){
          print("${response.statusCode} ${response.statusMessage} ${response.data}");
        }
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL,
        headers: {"Authorization" : "Bearer $API_KEY"}
    ));

    initializeInterceptor();
  }
  
}