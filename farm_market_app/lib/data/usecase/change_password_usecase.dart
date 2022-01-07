import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:farm_market_app/constants/constants.dart';
import 'package:farm_market_app/core/core.dart';
import 'package:farm_market_app/data/data.dart';
import 'package:farm_market_app/data/request/change_password_request.dart';
import 'package:farm_market_app/data/request/login_request.dart';
import 'package:farm_market_app/data/response/change_password_response.dart';
import 'package:farm_market_app/data/response/login_response.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/http.dart';
import '../network_response_model.dart';
import '../wifi_service.dart';
import 'base_usecase.dart';

class ChangePasswordUsecase {
  Future<ChangePasswordResponse> changePasswordResponse(
      FormData formData) async {
    //dio.interceptors.add(Logging());
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) NetworkResponse.withDisconnect();
    ChangePasswordResponse response = ChangePasswordResponse();
    Response? responseData;
    try {
      Dio dio = Dio();
      dio.interceptors.add(Logging());
      dio.options.headers["Content-Type"] = "multipart/form-data";
      responseData = await dio.put(EndPoint.changePassword, data: formData);
      response = ChangePasswordResponse.fromJson(responseData.data);
      print('hihiihi ${responseData.data}');
    } on DioError catch (e) {
      print('hhihhi ${e.response!.data}');
      response = ChangePasswordResponse.fromJson(e.response!.data);
      return response;
      //NetworkResponse.withErrorConvert(e);
    }
    return response;
  }
}
