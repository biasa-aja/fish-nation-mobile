import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: Constant.GENERAL_SANS,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: BaseColor.primary,
    primaryColorDark: BaseColor.primary,
    primaryColorLight: BaseColor.primary,
    disabledColor: BaseColor.disable,
    hintColor: const Color(0xff94A3B8),
    cardColor: BaseColor.white,
    appBarTheme: _appBarTheme,
    elevatedButtonTheme: _elevatedButtonThemeData,
    outlinedButtonTheme: _oulinedButtonThemeData,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    bottomNavigationBarTheme: _bottomNavigationBarThemeData,
    tabBarTheme: _tabBarTheme,
    snackBarTheme: _snackBarThemeData,
    progressIndicatorTheme: _progressIndicatorThemeData,
    dropdownMenuTheme: _dropdownMenuThemeData,
    bottomSheetTheme: _bottomSheetThemeData,
    indicatorColor: BaseColor.primary,
  );
}

AppBarTheme _appBarTheme = const AppBarTheme(
  elevation: 0,
  backgroundColor: BaseColor.white,
  titleTextStyle: TextStyle(
    fontFamily: Constant.CLASH_DISPLAY,
    color: BaseColor.black,
    fontSize: 19.2,
    fontWeight: FontWeight.w600,
  ),
  iconTheme: IconThemeData(
    color: BaseColor.black,
    size: 26,
  ),
  actionsIconTheme: IconThemeData(
    color: BaseColor.black,
    size: 26,
  ),
  scrolledUnderElevation: 0,
);

ElevatedButtonThemeData _elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return BaseColor.primary;
        }

        if (states.contains(WidgetState.disabled)) {
          return BaseColor.disable;
        }

        return BaseColor.primary; // Use the component's default.
      },
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return BaseColor.white.withOpacity(0.05);
        }

        if (states.contains(WidgetState.disabled)) {
          return BaseColor.disable;
        }

        return BaseColor.white.withOpacity(0.05);
      },
    ),
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    foregroundColor: const WidgetStatePropertyAll(Color(0xffF0F0F0)),
    textStyle: const WidgetStatePropertyAll(
      TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
    ),
  ),
);

OutlinedButtonThemeData _oulinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return BaseColor.white;
        }

        if (states.contains(WidgetState.disabled)) {
          return BaseColor.disable;
        }

        return BaseColor.white; // Use the component's default.
      },
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return BaseColor.primary.withOpacity(0.05);
        }

        if (states.contains(WidgetState.disabled)) {
          return BaseColor.disable;
        }

        return BaseColor.primary.withOpacity(0.05);
      },
    ),
    padding: const WidgetStatePropertyAll(
      EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    side: const WidgetStatePropertyAll(
      BorderSide(
        color: BaseColor.primary,
        width: 1.5,
      ),
    ),
    foregroundColor: const WidgetStatePropertyAll(BaseColor.primary),
    textStyle: const WidgetStatePropertyAll(
      TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
    ),
  ),
);

TextTheme _textTheme = const TextTheme(
  displayLarge: TextStyle(
    color: BaseColor.black,
    fontSize: 57,
    fontWeight: FontWeight.w800,
  ),
  displayMedium: TextStyle(
    color: BaseColor.black,
    fontSize: 45,
    fontWeight: FontWeight.w800,
  ),
  displaySmall: TextStyle(
    color: BaseColor.black,
    fontSize: 36,
    fontWeight: FontWeight.w800,
  ),
  headlineLarge: TextStyle(
    color: BaseColor.black,
    fontSize: 32,
    fontWeight: FontWeight.w800,
  ),
  headlineMedium: TextStyle(
    color: BaseColor.black,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  ),
  headlineSmall: TextStyle(
    color: BaseColor.black,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  ),
  titleLarge: TextStyle(
    color: BaseColor.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  titleMedium: TextStyle(
    color: BaseColor.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  titleSmall: TextStyle(
    color: BaseColor.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  labelLarge: TextStyle(
    color: BaseColor.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ),
  labelMedium: TextStyle(
    color: BaseColor.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  ),
  labelSmall: TextStyle(
    color: BaseColor.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodyLarge: TextStyle(
    color: BaseColor.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: TextStyle(
    color: BaseColor.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    color: BaseColor.black,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  ),
);

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  filled: true,
  fillColor: BaseColor.white,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(
      width: 2,
      color: Color(0xffCCCCCC),
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(
      width: 2,
      color: Color(0xffCCCCCC),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(
      width: 2,
      color: Color(0xffCCCCCC),
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(
      width: 2,
      color: BaseColor.danger,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide: const BorderSide(
      width: 2,
      color: BaseColor.danger,
    ),
  ),
  hintStyle: const TextStyle(
    color: Color(0xffAAAAAA),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1,
  ),
  errorStyle: const TextStyle(
    color: BaseColor.danger,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1,
  ),
  isDense: true,
);

BottomNavigationBarThemeData _bottomNavigationBarThemeData =
    const BottomNavigationBarThemeData(
  backgroundColor: BaseColor.white,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: BaseColor.primary,
  selectedLabelStyle: TextStyle(
    color: BaseColor.primary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
  unselectedItemColor: BaseColor.unSelect,
  unselectedLabelStyle: TextStyle(
    color: BaseColor.unSelect,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
);

TabBarTheme _tabBarTheme = TabBarTheme(
  labelColor: BaseColor.text,
  indicatorColor: BaseColor.primary,
  unselectedLabelColor: BaseColor.text,
  dividerColor: const Color(0xffF3F3F3),
  dividerHeight: 3,
  indicatorSize: TabBarIndicatorSize.tab,
  indicator: const UnderlineTabIndicator(
    // color for indicator (underline)
    borderSide: BorderSide(color: BaseColor.primary, width: 3),
  ),
  overlayColor: WidgetStateProperty.resolveWith<Color>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return BaseColor.primary.withOpacity(0.05);
      }

      if (states.contains(WidgetState.disabled)) {
        return BaseColor.disable;
      }

      return BaseColor.primary.withOpacity(0.05);
    },
  ),
  labelStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: BaseColor.text,
  ),
  unselectedLabelStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: BaseColor.text,
  ),
);

SnackBarThemeData _snackBarThemeData = SnackBarThemeData(
  showCloseIcon: true,
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  contentTextStyle: TextStyle(
    fontSize: 12,
    color: BaseColor.grey.shade900,
    fontWeight: FontWeight.w400,
  ),
  backgroundColor: BaseColor.green.shade100,
  closeIconColor: BaseColor.green.shade800,
  insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6),
  ),
);

ProgressIndicatorThemeData _progressIndicatorThemeData =
    const ProgressIndicatorThemeData(color: BaseColor.primary);

DropdownMenuThemeData _dropdownMenuThemeData = DropdownMenuThemeData(
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: BaseColor.border,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: BaseColor.primary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: BaseColor.danger,
      ),
    ),
    errorStyle: const TextStyle(
      color: BaseColor.danger,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1,
    ),
    filled: true,
    fillColor: BaseColor.white,
  ),
);

BottomSheetThemeData _bottomSheetThemeData = const BottomSheetThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
  ),
  modalBackgroundColor: BaseColor.white,
  backgroundColor: BaseColor.white,
  surfaceTintColor: BaseColor.white,
);
