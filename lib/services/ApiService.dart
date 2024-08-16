import 'dart:convert';

import 'package:barfly_user/Storage.dart';
import 'package:barfly_user/components/OrderDetails.dart';
import 'package:barfly_user/models/CounterListResponse.dart';
import 'package:barfly_user/models/EntityLiveOrders.dart';
import 'package:barfly_user/models/MenuCategory.dart';
import 'package:barfly_user/models/getEntities.dart';
import 'package:barfly_user/models/getLiveOrders.dart';
import 'package:barfly_user/models/getPreviousOrderResponse.dart';
import 'package:barfly_user/models/login.dart';
import 'package:barfly_user/models/menu_category_items.dart';
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
      var response = await dio.request(
        '$APIURL/api/customer/auth/login',
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

  Future<ReturnObj> getEntities(
      String searchTerm, bool isFavouriteEntities) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();

      var response = await dio.request(
        '$APIURL/api/customer/get-entities',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        queryParameters: {
          'searchTerm': searchTerm, // Pass searchTerm as a map entry
          "isFavouriteEntities": isFavouriteEntities
        },
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
      return ReturnObj(
          status: false,
          message: e.response?.data["message"] ?? "Unknown error");
    } catch (error) {
      print("Error in Login $error");
      return ReturnObj(status: false, message: "Error in Login $error");
    }
  }

  Future<ReturnObj<List<CounterList>>> getCounters(String entityId) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var data = {"entityId": entityId};
      var response = await dio.request('$APIURL/api/customer/get-counter-list',
          options: Options(
            method: 'GET',
            headers: headers,
          ),
          queryParameters: data);

      if (response.statusCode == 200) {
        CounterListResponse counterListResponse =
            CounterListResponse.fromJson(response.data);
        return ReturnObj<List<CounterList>>(
            status: true,
            message: response.data["message"],
            data: counterListResponse.counterLists);
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

  Future<ReturnObj<List<MenuList>>> getMenuCategory(String counterId) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var data = {"counterId": counterId};
      var response =
          await dio.request('$APIURL/api/customer/get-counter-menu-category',
              options: Options(
                method: 'GET',
                headers: headers,
              ),
              queryParameters: data);

      if (response.statusCode == 200) {
        MenuCategoryResponse menuCategoryResponse =
            MenuCategoryResponse.fromJson(response.data);
        return ReturnObj<List<MenuList>>(
            status: true,
            message: response.data["message"],
            data: menuCategoryResponse.menuLists);
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

  Future<ReturnObj<List<MenuItem>>> getMenuCategoryItems(String menuId) async {
    try {
      print("reached ion MenuItems");
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var data = {"menuCategoryId": menuId};
      var response =
          await dio.request('$APIURL/api/customer/get-menu-category-items',
              options: Options(
                method: 'GET',
                headers: headers,
              ),
              queryParameters: data);

      if (response.statusCode == 200) {
        MenuCategoryItem menuCategoryItem =
            MenuCategoryItem.fromJson(response.data);
        return ReturnObj<List<MenuItem>>(
            status: true,
            message: response.data["message"],
            data: menuCategoryItem.menuItems);
      }
      print("reachde hrerere");
      return ReturnObj(message: response.data["message"], status: false);
    } on DioException catch (e) {
      print("Error in Login $e");
      return ReturnObj(status: false, message: e.response!.data["message"]);
    } catch (error) {
      print("Error in Login $error");
      return ReturnObj(status: false, message: "Error in Login $error");
    }
  }

  Future<ReturnObj> createOrder(Map<String, OrderDetails> orderDetails) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var data = json.encode({
        "items": orderDetails.entries
            .map((entry) => {
                  "itemId": entry.value.itemId,
                  "quantity": entry.value.quantity
                })
            .toList()
      });
      var response = await dio.request('$APIURL/api/orders/create-order',
          options: Options(
            method: 'POST',
            headers: headers,
          ),
          data: data);

      if (response.statusCode == 200) {
        return ReturnObj(status: true, message: response.data["message"]);
      }
      print("reachde hrerere");
      return ReturnObj(message: response.data["message"], status: false);
    } on DioException catch (e) {
      print("Error in Login $e");
      return ReturnObj(status: false, message: e.response!.data["message"]);
    } catch (error) {
      print("Error in Login $error");
      return ReturnObj(status: false, message: "Error in Login $error");
    }
  }

  Future<ReturnObj> addFavourite(String entityId, bool isFavourite) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var data =
          json.encode({"entityId": entityId, "isFavourite": isFavourite});
      var response =
          await dio.request('$APIURL/api/customer/add-favourite-entity',
              options: Options(
                method: 'POST',
                headers: headers,
              ),
              data: data);

      if (response.statusCode == 200) {
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

  Future<ReturnObj<List<LiveOrder>>> getLiveOrders() async {
    try {
      print("reached ion MenuItems");
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var response = await dio.request(
        '$APIURL/api/orders/get-live-orders-user',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        LiveOrdersResponse liveOrdersResponse =
            LiveOrdersResponse.fromJson(response.data);
        return ReturnObj<List<LiveOrder>>(
            status: true,
            message: response.data["message"],
            data: liveOrdersResponse.liveOrders);
      }
      print("reachde hrerere");
      return ReturnObj(message: response.data["message"], status: false);
    } on DioException catch (e) {
      print("Error in Login $e");
      return ReturnObj(status: false, message: e.response!.data["message"]);
    } catch (error) {
      print("Error in Login $error");
      return ReturnObj(status: false, message: "Error in Login $error");
    }
  }

  Future<ReturnObj<List<PreviosuOrdersList>>> getPreviousOrderList() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var response = await dio.request(
        '$APIURL/api/orders/get-users-orders-group-by-years',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        PreviousOrderResponse previosuOrdersResponse =
            PreviousOrderResponse.fromJson(response.data);
        return ReturnObj<List<PreviosuOrdersList>>(
            status: true,
            message: response.data["message"],
            data: previosuOrdersResponse.previosuOrdersList);
      }
      print("reachde hrerere");
      return ReturnObj(message: response.data["message"], status: false);
    } on DioException catch (e) {
      print("Error in Login $e");
      return ReturnObj(status: false, message: e.response!.data["message"]);
    } catch (error) {
      print("Error in Login $error");
      return ReturnObj(status: false, message: "Error in Login $error");
    }
  }

  Future<ReturnObj<List<LiveOrderEntity>>> getLiveOrdersEntity(entityId) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      headers['token'] = Storage.getJwtToken();
      var data = {"entityId": entityId};
      var response =
          await dio.request('$APIURL/api/orders/get-live-order-details',
              options: Options(
                method: 'GET',
                headers: headers,
              ),
              queryParameters: data);

      if (response.statusCode == 200) {
        EntityLiveOrderResponse previosuOrdersResponse =
            EntityLiveOrderResponse.fromJson(response.data);
        return ReturnObj<List<LiveOrderEntity>>(
            status: true,
            message: response.data["message"],
            data: previosuOrdersResponse.liveOrders);
      }
      print("reachde hrerere");
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
