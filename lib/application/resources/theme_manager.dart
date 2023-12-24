import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors_manager.dart';
import 'fonts_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    titleLarge:
        getBoldStyle(color: AppColors.whiteColor, fontSize: FontSize.s20),
    //FontSize from 24 to 36
    titleMedium:
        getMediumStyle(color: AppColors.whiteColor, fontSize: FontSize.s16),
    //FontSize from 16 to 24
    titleSmall:
        getBoldStyle(color: AppColors.whiteColor, fontSize: FontSize.s12),
    bodyMedium:
        getMediumStyle(color: AppColors.blackColor, fontSize: FontSize.s16),
    bodySmall:
        getMediumStyle(color: AppColors.blackColor, fontSize: FontSize.s12),
    labelMedium:
        getRegularStyle(color: AppColors.whiteColor, fontSize: FontSize.s12),
    labelSmall:
        getRegularStyle(color: AppColors.errorColor, fontSize: FontSize.s10),
  ); //FontSize from 14 to 18
  static TextTheme darkTextTheme = TextTheme(
    titleLarge:
        getBoldStyle(color: AppColors.blackColor, fontSize: FontSize.s20),
    //FontSize from 24 to 36
    titleMedium:
        getMediumStyle(color: AppColors.blackColor, fontSize: FontSize.s16),
    //FontSize from 18 to 24
    titleSmall:
        getRegularStyle(color: AppColors.blackColor, fontSize: FontSize.s12),
    bodyMedium:
        getMediumStyle(color: AppColors.whiteColor, fontSize: FontSize.s16),
    bodySmall:
        getMediumStyle(color: AppColors.whiteColor, fontSize: FontSize.s12),
    labelMedium:
        getRegularStyle(color: AppColors.blackColor, fontSize: FontSize.s12),
    //for error messages
    labelSmall:
        getRegularStyle(color: AppColors.errorColor, fontSize: FontSize.s10),
  ); //FontSize from 14 to 18

  static ThemeData light() {
    return ThemeData(
      splashColor: AppColors.blackColor,
      cardColor: AppColors.whiteColor,
      primaryColorLight: AppColors.primaryColorLight,
      useMaterial3: true,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return AppColors.blackColor;
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTheme.darkTextTheme.titleLarge,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.whiteColor),
        backgroundColor: AppColors.whiteColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.blackColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.disabledColor,
        backgroundColor: AppColors.whiteColor,
      ),
      cardTheme: CardTheme(
        color: AppColors.whiteColor,
        shadowColor: AppColors.whiteColor,
        elevation: AppSize.size1_5,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.whiteColor),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSize.size16))),
      ),
      snackBarTheme: SnackBarThemeData(backgroundColor: AppColors.blackColor),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: focusedBorder(),
          enabledBorder: inputBorder(),
          errorBorder: errorBorder(),
          focusedErrorBorder: errorBorder(),
          errorStyle: AppTheme.lightTextTheme.labelSmall,
          errorMaxLines: 2,
          labelStyle: AppTheme.darkTextTheme.titleSmall,
          hintStyle: AppTheme.darkTextTheme.titleSmall),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              elevation: AppSize.size1_5,
              backgroundColor: AppColors.whiteColor,
              shadowColor: AppColors.primaryColor)),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.whiteColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.size16),
          borderSide:
              BorderSide(width: AppSize.size1, color: AppColors.primaryColor),
        ),
      ),
      textTheme: darkTextTheme,
    );
  }

// 4
  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      cardColor: AppColors.blackColor,
      splashColor: AppColors.whiteColor,
      primaryColorLight: AppColors.primaryColorLight,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTheme.lightTextTheme.titleLarge,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: AppColors.blackColor),
        backgroundColor: AppColors.blackColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        backgroundColor: AppColors.blackColor,
      ),
      cardTheme: CardTheme(
          color: AppColors.blackColor,
          shadowColor: AppColors.blackColor,
          elevation: AppSize.size1_5,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.blackColor),
              borderRadius: BorderRadius.circular(AppSize.size16))),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: focusedBorder(),
          enabledBorder: inputBorder(),
          errorBorder: errorBorder(),
          focusedErrorBorder: errorBorder(),
          errorStyle: AppTheme.lightTextTheme.labelSmall,
          labelStyle: AppTheme.lightTextTheme.titleSmall,
          hintStyle: AppTheme.lightTextTheme.titleSmall),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: AppSize.size1_5,
              textStyle: AppTheme.lightTextTheme.titleSmall,
              backgroundColor: AppColors.blackColor,
              shadowColor: AppColors.primaryColor)),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.blackColor,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.size16),
          borderSide:
              BorderSide(width: AppSize.size1, color: AppColors.primaryColor),
        ),
      ),
      snackBarTheme: SnackBarThemeData(backgroundColor: AppColors.whiteColor),
      textTheme: lightTextTheme,
    );
  }
}

errorBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.size12),
    borderSide: BorderSide(width: AppSize.size1, color: AppColors.errorColor),
  );
}

focusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.size12),
    borderSide: BorderSide(width: AppSize.size1, color: AppColors.blueColor),
  );
}

inputBorder() {
  return UnderlineInputBorder(
    borderRadius: BorderRadius.circular(AppSize.size12),
    borderSide: BorderSide(width: AppSize.size1, color: AppColors.primaryColor),
  );
}
