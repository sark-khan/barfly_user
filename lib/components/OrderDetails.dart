class OrderDetails {
  String itemName;
  String itemId;
  int quantity;
  String weightOrVolume;

  OrderDetails(
      {required this.itemName,
      required this.itemId,
      required this.quantity,
      required this.weightOrVolume});

  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'itemId': itemId,
      'quantity': quantity,
      'weightOrVolume': weightOrVolume,
    };
  }

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      itemName: json['itemName'],
      itemId: json['itemId'],
      quantity: json['quantity'],
      weightOrVolume: json['weightOrVolume'],
    );
  }
}
