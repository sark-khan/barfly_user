import 'package:barfly_user/commonFunctions.dart';
import 'package:flutter/material.dart';

class OrderViewRow extends StatelessWidget {
  final quantity;
  final itemName;
  final itemId;
  final weightOrVolume;

  const OrderViewRow(
      {Key? key,
      required this.quantity,
      required this.itemName,
      required this.itemId,
      required this.weightOrVolume});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.only(left: 41),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    '${quantity}x',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '${itemName} ($weightOrVolume)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ]));
  }
}
