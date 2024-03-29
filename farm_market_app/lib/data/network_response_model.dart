import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:farm_market_app/utils/toast/toast_utils.dart';
import 'package:get/get.dart';

const int _SUCCESS = 200;
const int _ERROR_TOKEN = 401;
const int _ERROR_VALIDATE = 422;
const int _ERROR_SERVER = 500;
const int _ERROR_DISCONNECT = -1;

class NetworkResponse<T> with ToastUtils {
  int? code;
  String? msg;
  T? data;

  bool get isSuccess => code == _SUCCESS && data != null;

  bool get isError => code != _SUCCESS || data == null;

  NetworkResponse({this.msg, this.data, this.code});

  factory NetworkResponse.fromResponse(Dio.Response response, {converter}) {
    try {
      return NetworkResponse._fromJson(jsonDecode(jsonEncode(response.data)),
          converter: converter)
        ..code = response.statusCode;
    } catch (e) {
      log("Error NetworkResponse.fromResponse: $e");
      return NetworkResponse.withErrorConvert(e);
    }
  }

  NetworkResponse._fromJson(dynamic json, {converter}) {
    msg = json["msg"];
    data = converter != null && json["data"] != null
        ? converter(json["data"])
        : json["data"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["msg"] = msg;
    map["data"] = data;
    return map;
  }

  NetworkResponse.withErrorRequest(Dio.DioError error) {
    try {
      Dio.Response? response = error.response;
      this.code = response?.statusCode ?? _ERROR_SERVER;
    } catch (e) {
      log("Error NetworkResponse.withErrorRequest: $e");
    } finally {
      errorToast('msg_error_request'.tr);
      this.msg = 'msg_error_request'.tr;
      this.data = null;
    }
  }

  NetworkResponse.withErrorConvert(error) {
    errorToast('msg_error_convert'.tr);
    this.msg = 'msg_error_convert'.tr;
    this.data = error;
  }

  NetworkResponse.withDisconnect() {
    errorToast('msg_disconnect'.tr);
    this.msg = 'msg_disconnect'.tr;
    this.data = null;
  }
}
