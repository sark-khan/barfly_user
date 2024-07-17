import 'package:flutter/material.dart';

class DropdownMenuCustom extends StatefulWidget {
  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenuCustom> {
  String selectedValue = 'V';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            iconSize: 24,
            dropdownColor: Colors.blueGrey[900],
            underline: SizedBox(),
            style: TextStyle(color: Colors.white, fontSize: 16),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: <String>['V', 'Option 1', 'Option 2', 'Option 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
