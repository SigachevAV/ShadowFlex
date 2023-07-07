import 'package:flutter/material.dart';

class ColorShemeMine {
  Color GetBackgroundDark() {
    return Color.fromARGB(255, 41, 32, 32);
  }

  Color GetUnderlineDark() {
    return Color.fromARGB(255, 93, 88, 88);
  }

  Color GetUninteractiveDark() {
    return Color.fromARGB(255, 53, 45, 45);
  }

  Color GetTextDark() {
    return Color.fromARGB(255, 255, 255, 255);
  }

  Color GetAkcent() {
    return Color.fromARGB(255, 160, 69, 143);
  }

  MaterialColor GetAkcentMaterial() {
    return GetMaterialColor(GetAkcent());
  }

  MaterialColor GetMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    final int alpha = color.alpha;

    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };

    return MaterialColor(color.value, shades);
  }
}
