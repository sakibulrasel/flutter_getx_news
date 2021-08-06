import 'package:dio/dio.dart';

/**
 * Created by sakibul.haque on 19,June,2021
 */

abstract class HttpService{
  void init();

  Future<Response> getRequest(String url);

}