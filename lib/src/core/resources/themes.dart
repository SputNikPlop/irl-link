import 'package:flutter/material.dart';

class Themes {
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      surface: const Color(0xFF0e0e10),
      secondary: const Color(0xFF18181b),
      error: const Color(0xFFEC0808),

      //buttons color
      tertiary: Colors.deepPurpleAccent[200],
      tertiaryContainer: Colors.grey[850],
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[600]!),
      ),
      hintStyle: const TextStyle(
        color: Color.fromARGB(255, 75, 75, 75),
        fontSize: 16,
      ),
      helperStyle: const TextStyle(
        color: Colors.white,
      ),
      labelStyle: TextStyle(
        color: Colors.deepPurpleAccent[200],
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[600]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurpleAccent[200]!),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.deepPurpleAccent[200],
      unselectedLabelColor: Colors.white,
      dividerColor: Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Color(0xFF18181b),
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 2,
      indent: 0,
      endIndent: 0,
      color: Color(0xFF18181b),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 12,
          ),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 12,
          ),
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent[200]),
      ),
    ),
    chipTheme: const ChipThemeData(
        deleteIconColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        side: BorderSide(
          color: Colors.white,
        )),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          return Colors.white;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.deepPurpleAccent[200];
          }
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey[850];
          }
          return Colors.grey[850];
        },
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.deepPurpleAccent[200],
      inactiveTrackColor: Colors.grey[850],
      thumbColor: Colors.white,
      // overlayColor: Colors.deepPurpleAccent[200],
      // trackHeight: 2,
      // thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
      // overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
    ),
  );

  final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      surface: const Color(0xFFffffff),
      secondary: const Color(0xFFefeff1),
      error: const Color(0xFFEC0808),

      //buttons color
      tertiary: Colors.deepPurpleAccent[200],
      tertiaryContainer: Colors.grey[850],
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      helperStyle: const TextStyle(
        color: Color.fromARGB(255, 28, 25, 25),
      ),
      hintStyle: const TextStyle(
        color: Color.fromARGB(255, 75, 75, 75),
        fontSize: 16,
      ),
      labelStyle: TextStyle(
        color: Colors.deepPurpleAccent[200],
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[600]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurpleAccent[200]!),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.deepPurpleAccent[200],
      unselectedLabelColor: Colors.black,
      dividerColor: Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFefeff1),
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 2,
      indent: 0,
      endIndent: 0,
      color: Color(0xFFefeff1),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 12,
          ),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 12,
          ),
        ),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent[200]),
      ),
    ),
    chipTheme: const ChipThemeData(
        deleteIconColor: Colors.black,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        side: BorderSide(
          color: Colors.black,
        )),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          return Colors.white;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.deepPurpleAccent[200];
          }
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey[850];
          }
          return Colors.grey[850];
        },
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.deepPurpleAccent[200],
      inactiveTrackColor: Colors.grey[850],
      thumbColor: Colors.deepPurpleAccent[400],
      // overlayColor: Colors.deepPurpleAccent[200],
      // trackHeight: 2,
      // thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
      // overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
    ),
  );
}
