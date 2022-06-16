

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:simple_auth_1/commons/network/network_response.dart';
import 'package:simple_auth_1/typi_code/post.dart';
import 'package:simple_auth_1/utils/tuple.dart';

import '../constants.dart';

enum NetworkType { GET, POST, PUT, DELETE }


extension NetworkTypeExtension on NetworkType {
  String toValue() {
    switch (this) {
      case NetworkType.POST:
        return "POST";
      case NetworkType.GET:
        return "GET";
      default:
        return "-1";
    }
  }
}

class NetworkDioApi {


  // region Make Singleton Class
  static final NetworkDioApi _singleton = NetworkDioApi._internal();
  factory NetworkDioApi() {
    return _singleton;
  }

  NetworkDioApi._internal() {
    /* Config Dio */
    final options = BaseOptions(
      baseUrl: NetworkConfig.baseURL,
      connectTimeout: 60000,
      receiveTimeout: 60000,
    );

    _dio = Dio(options);

    /* Add log interceptor */

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }
  // endregion

  late Dio _dio;

  Future<Tuple<T?, BaseError?>> hardCall<T>(String url, NetworkType type) async {
    try {
      final params = {
      };

      Response<T> result;
      if (type == NetworkType.POST) {
        result = await _dio.post<T>(url, data: params,);
      } else {
        result = await _dio.get<T>(url);
      }
      return Tuple(result.data, null);
    } on DioError catch (ex) {
      return Tuple(null, BaseError(ex.message));
    } on Error catch (error) {
      return Tuple(null, BaseError("Error : " + error.toString()));
    } on Exception catch (ex) {
      return Tuple(null, BaseError("Exception : " + ex.toString()));
    }
  }

  Future<List?> testCall(String url, NetworkType type) async {
    try {
      Response<List> result = await _dio.get(url);

      log("count = + ${result.data?.length.toString()}" );

      return result.data;
    } on DioError catch (ex) {
      return null;
    }
  }


  Future<T?> simpleCall<T>(String url, NetworkType type) async {
    try {
      final params = {
      };

      Response<T> result;
      if (type == NetworkType.POST) {
        result = await _dio.post<T>(url, data: params,);
      } else {
        result = await _dio.get<T>(url);
      }
      return result.data;
    } on DioError catch (ex) {
      return null;
    }
  }

  // T only is : List, Map<String, dynamic>
  Future<Tuple<T?, BaseError?>> call<T>(String url, {Dictionary? params, NetworkType type = NetworkType.GET}) async {

    if (T is! List || T is! Map<String, dynamic>) {
      return const Tuple(null, BaseError("Cast error: T only is : List, Map<String, dynamic>"));
    }

    try {
      Response<Dictionary> result;
      if (type == NetworkType.POST) {
        result = await _dio.post(url, data: params,);
      } else {
        result = await _dio.get(url);
      }

      final json = result.data;
      if (json != null) {
        final networkResponse = NetworkResponse.fromJson(json);
        // Kiem tra cac loi tu server tra ve va xu ly
        if (networkResponse.result == false) {
          return const Tuple(null, null); // cac loi tra ve tu server
        }
        return Tuple(networkResponse.data as T, null);

      }


      // return ve loi
      return const Tuple(null, null);
    } on DioError catch (ex) {
      return Tuple(null, BaseError(ex.message));
    } on Error catch (error) {
      return Tuple(null, BaseError("Error : " + error.toString()));
    } on Exception catch (ex) {
      return Tuple(null, BaseError("Exception : " + ex.toString()));
    }
  }


  // Sai khong su dung dc voi doi tuong nhu Post
  // Phai dung kieu du lieu co ban : List, Map<String, dynamic>
  Future<void> callPost(String url) async {

    try {
      final params = {
//        "fromDate": fromDate,
//        "listingTypes": listingTypes.map((e) => e.id).toList(),
//        "scorecardTypes": dealScorecardTypes.map((e) => e.stringId).toList(),
//        "toDate": toDate,
//        "statusDeals": dealStatus.map((e) => e.id).toList(),
//         "textSearch": textSearch
      };
      Response<Post> result = await _dio.post<Post>(url, data: params,);
      //return handleListResponse<Deal>(result);
    } on DioError catch (ex) {
      //return handleException(ex);
    }


    //jsonDecode(source)
  }



}
