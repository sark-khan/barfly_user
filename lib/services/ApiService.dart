import 'dart:convert';

import 'package:barfly_user/Storage.dart';
import 'package:barfly_user/models/getEntities.dart';
import 'package:barfly_user/models/login.dart';
import 'package:barfly_user/return_obj.dart';
import 'package:dio/dio.dart';

class Apiservice {
  static Dio dio = Dio();
  static String APIURL = "http://192.168.10.10:2000";
  // static String APIURL = "http://43.204.181.73";
  static var headers = {'Content-Type': 'application/json'};

  Future<ReturnObj> login(String emailOrContactNumber, String password) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode({
        "emailOrContactNumber": emailOrContactNumber.toLowerCase(),
        "password": password,
      });
      var dio = Dio();
      var response = await dio.request(
        '$APIURL/auth/customer-api/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Login loginResponse = Login.fromJson(response.data);
        print("${loginResponse.token} hhhh");
        Storage.addJwtToken(loginResponse.token);
        print("${Storage.getJwtToken()} hhhh1111111");
        Storage.setUser(loginResponse.userDetails);
        return ReturnObj(status: true, message: response.data["message"]);
      }
      return ReturnObj(message: response.data["message"], status: false);
    } on DioException catch (e) {
      print("Error in Login $e");
      return ReturnObj(status: false, message: e.response!.data["message"]);
    } catch (error) {
      print("Error in Login $error");
      return ReturnObj(status: false, message: "Error in Login $error");
    }
  }

  Future<ReturnObj> getEntities() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var dio = Dio();
      var response = await dio.request(
        '$APIURL/api/customer/get-entities',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        GetEntitties entityResponse = GetEntitties.fromJson(response.data);
        return ReturnObj<EntityEvents>(
            status: true,
            message: response.data["message"],
            data: entityResponse.entityEvents);
      }
      return ReturnObj(message: response.data["message"], status: false);
    } on DioException catch (e) {
      print("Error in Login $e");
      return ReturnObj(status: false, message: e.response!.data["message"]);
    } catch (error) {
      print("Error in Login $error");
      return ReturnObj(status: false, message: "Error in Login $error");
    }
  }
}
