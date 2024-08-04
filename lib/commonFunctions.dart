import 'package:barfly_user/Storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

double getResponsiveFontSize(
    double screenWidth, double screenHeight, double size) {
  double widthFactor = screenWidth / 393;
  double heightFactor = screenHeight / 852;
  double factor = (widthFactor + heightFactor) / 2; // Average of both factors

  // Apply scaling based on screen width ranges
  if (screenWidth < 400) {
    return size; // Use the input size directly for screen widths less than 400
  } else if (screenWidth < 600) {
    return size * factor * 0.9; // Slight increase for small screens (phones)
  } else if (screenWidth < 1200) {
    return size *
        factor *
        0.95; // Slightly reduced scaling for medium screens (tablets)
  } else {
    return size *
        factor *
        1.05; // Slightly increased scaling for large screens (desktops)
  }
}

double getResponsiveSizedBoxHeight(double screenHeight, double size) {
  double factor = screenHeight / 852;
  if (screenHeight < 750) {
    // Smaller phones and older devices
    return size * factor * 0.60;
  } else if (screenHeight < 900) {
    // Larger phones and small tablets
    return size * factor * 0.85;
  } else if (screenHeight < 1200) {
    // Standard tablets and smaller laptops
    return size * factor * 0.95;
  } else {
    return size *
        factor; // Large screens, including desktops and larger laptops
  }
}

double getResponsiveSizedBoxWidth(double screenWidth, double size) {
  double factor = screenWidth / 393;
  if (screenWidth < 400) {
    // Smaller phones and older devices
    return size * factor * 0.60;
  } else if (screenWidth < 600) {
    // Larger phones and small tablets
    return size * factor * 0.85;
  } else if (screenWidth < 1200) {
    // Standard tablets and smaller laptops
    return size * factor * 0.95;
  } else {
    return size *
        factor; // Large screens, including desktops and larger laptops
  }
}

// String getUserRole() => Jwt.parseJwt(Storage.getJwtToken())['role'];
// String getUserName() => Jwt.parseJwt(Storage.getJwtToken())['name'];
// String getDestination() => Jwt.parseJwt(Storage.getJwtToken())['city']!;
