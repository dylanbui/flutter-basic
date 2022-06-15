

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants.dart';

class NetworkDioApi {

  late Dio _dio;


  NetworkDioApi() {
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

  void call() {


    //jsonDecode(source)
  }

  // @override
  // Future<NetworkResult<User, NetworkError>> login(String userName, String password, String fbToken, String os) =>
  //     _authenticateAPI.login(userName, password, fbToken, os);
  //
  // @override
  // Future<NetworkResult<Map<String, dynamic>, NetworkError>> logout(String token, String fbToken, String os) =>
  //     _authenticateAPI.logout(os, fbToken, token);
  //
  // @override
  // Future<NetworkResult<NetworkResultPaging<Deal>, NetworkError>> getDeals({
  //   String token,
  //   int fromDate,
  //   int toDate,
  //   List<ListingTypes> listingTypes,
  //   List<DealScorecardTypes> dealScorecardTypes,
  //   List<DealStatus> dealStatus,
  //   int page,
  //   int numberItem,
  //   String textSearch,
  // }) =>
  //     _dealApi.getDeals(
  //       token: token,
  //       fromDate: fromDate,
  //       toDate: toDate,
  //       listingTypes: listingTypes,
  //       dealScorecardTypes: dealScorecardTypes,
  //       dealStatus: dealStatus,
  //       page: page,
  //       numberItem: numberItem,
  //       textSearch: textSearch,
  //     );
  //
  // @override
  // Future<NetworkResult<NetworkResultPaging<Listing>, NetworkError>> getListings({
  //   String token,
  //   int fromDate,
  //   int toDate,
  //   List<ListingScorecardTypes> listingScorecardTypes,
  //   int page,
  //   int numberItem,
  //   String textSearch,
  // }) => _listingApi.getListings(
  //   token: token,
  //   fromDate: fromDate,
  //   toDate: toDate,
  //   listingScorecardTypes: listingScorecardTypes,
  //   page: page,
  //   numberItem: numberItem,
  //   textSearch: textSearch,
  // );

}
