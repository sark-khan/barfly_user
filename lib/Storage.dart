import 'package:barfly_user/components/OrderDetails.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  static final box = GetStorage();

  static setUser(dynamic us) {
    box.write('user', us);
  }

  static setOrderDetails(Map<String, OrderDetails> orderDetails) {
    Map<String, dynamic> jsonOrderDetails = orderDetails.map((key, value) {
      return MapEntry(key, value.toJson());
    });
    box.write("orderDetails", jsonOrderDetails);
  }
  // static getOrderDetails(dynamic orderDetails) {
  //   box.write("orderDetails", orderDetails);
  // }

  static setTotalOrderPrice(double totalPrice) {
    box.write("totalPrice", totalPrice);
  }

  static removeTotalOrderPrice() {
    box.remove("totalPrice");
  }

  static removeOrderDetails() {
    box.remove("orderDetails");
  }
  //
  // static setLoginDetails(String accountNumberOrEmail, String password) {
  //   box.write('details',
  //       {"accountNumberOrEmail": accountNumberOrEmail, "password": password});
  // }

  static existsOrderDetails() {
    if (box.hasData("orderDetails")) {
      return true;
    }
    return false;
  }

  static getOrderDetails() {
    if (box.hasData("orderDetails")) {
      var jsonData = box.read("orderDetails") as Map<String, dynamic>;
      return jsonData.map((key, value) {
        return MapEntry(key, OrderDetails.fromJson(value));
      });
    }
    Map<String, OrderDetails> orderDetails = {};
    return orderDetails;
  }

  static getTotalPrice() {
    if (box.hasData("totalPrice")) {
      return box.read("totalPrice");
    }
    return 0;
  }

  static getUser() {
    if (box.hasData('user')) {
      return box.read('user');
    } else {
      return false;
    }
  }

  static dynamic getLoginDetails() {
    return box.read('details') ?? false;
  }

  static clearUser() {
    box.erase();
  }

  // static setBlockBackNavigation(bool u) {
  //   box.write('page', u);
  // }

  // static getPage() {
  //   return box.read('page') ?? false;
  // }

  static addJwtToken(String token) {
    box.write('token', token);
  }

  static getJwtToken() {
    return box.read('token') ?? "";
  }
}
