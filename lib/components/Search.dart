import 'package:flutter/material.dart';
import 'package:barfly_user/appConstants.dart';

class SearchComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;
  final String routeName;

  const SearchComponent({
    Key? key,
    required this.onPressed,
    this.backgroundColor = AppColors.searchButtonBackgroundColor,
    this.iconColor = AppColors.searchIconColor,
    this.iconSize = 25.0,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        width: 34,
        height: 32,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius:
              BorderRadius.circular(12.0), // Adjust the radius as needed
        ),
        child: Center(
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: onPressed,
            icon: Icon(
              Icons.search,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
