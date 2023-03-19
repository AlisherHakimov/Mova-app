import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

class ThemeProvider {
  static const Color headlineColorLight = AppColors.primaryTextLight;
  static const Color headlineColorDark = AppColors.primaryTextDark;
  static final lightTheme = ThemeData(
    backgroundColor: Colors.white,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(circularTrackColor: AppColors.primary),
    primaryIconTheme: const IconThemeData(color: AppColors.greyScale900),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldLight,
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.primary,
          brightness: Brightness.light,
        ),
    primaryColor: AppColors.primary,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyScale50,
      hintStyle: TextStyle(
        color: AppColors.greyScale500,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        letterSpacing: 1.4,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white.withOpacity(0.9),
    ),
    dividerColor: AppColors.greyScale50,
    fontFamily: GoogleFonts.urbanist().fontFamily,
    scaffoldBackgroundColor: AppColors.scaffoldLight,
    iconTheme: const IconThemeData(
      color: AppColors.iconLight,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: headlineColorLight,
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline2: TextStyle(
        color: headlineColorLight,
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline3: TextStyle(
        color: headlineColorLight,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline4: TextStyle(
        color: headlineColorLight,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline5: TextStyle(
        color: headlineColorLight,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline6: TextStyle(
        color: headlineColorLight,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    backgroundColor: AppColors.dark2,
    focusColor: AppColors.primary,
    primaryIconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      toolbarHeight: 64.h,
      backgroundColor: AppColors.scaffoldrDark,
    ),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.primary,
          brightness: Brightness.dark,
        ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.dark2),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.dark2,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark1.withOpacity(0.9),
    ),
    primaryColor: AppColors.primary,
    dividerColor: AppColors.dark3,
    fontFamily: GoogleFonts.urbanist().fontFamily,
    scaffoldBackgroundColor: AppColors.scaffoldrDark,
    iconTheme: const IconThemeData(color: AppColors.iconDark),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: headlineColorDark,
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline2: TextStyle(
        color: headlineColorDark,
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline3: TextStyle(
        color: headlineColorDark,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline4: TextStyle(
        color: headlineColorDark,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline5: TextStyle(
        color: headlineColorDark,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
      headline6: TextStyle(
        color: headlineColorDark,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
  );
}
