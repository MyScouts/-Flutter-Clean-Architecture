import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/base/resources/color_manager.dart';

class AppThemes {
  AppThemes._();

  static const String font = "Meiryo";

  // text theme for light theme
  static const TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 20.0, color: AppColor.lightTextColor, fontFamily: font),
    bodyText1: TextStyle(
        fontSize: 16.0, color: AppColor.lightTextColor, fontFamily: font),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey, fontFamily: font),
    button: TextStyle(
        fontSize: 15.0,
        color: AppColor.lightTextColor,
        fontWeight: FontWeight.w600,
        fontFamily: font),
    headline6: TextStyle(
        fontSize: 16.0, color: AppColor.lightTextColor, fontFamily: font),
    subtitle1: TextStyle(
        fontSize: 16.0, color: AppColor.lightTextColor, fontFamily: font),
    caption:
        TextStyle(fontSize: 12.0, color: AppColor.lightBackgroundAppBarColor),
  );

  static const Gradient defaultGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[AppColor.primaryDark, AppColor.primaryLight],
    tileMode: TileMode.repeated,
  );

  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25.0),
    ),
    borderSide: BorderSide(
      color: AppColor.textColor,
      width: 1.0,
    ),
  );

  static const InputDecoration roundedInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    hintText: "Aa",
    hintStyle: TextStyle(color: Colors.black54),
    border: defaultInputBorder,
    focusedBorder: defaultInputBorder,
    enabledBorder: defaultInputBorder,
    errorBorder: defaultInputBorder,
    disabledBorder: defaultInputBorder,
  );

  //the light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: font,
    unselectedWidgetColor: AppColor.textColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColor.textColor, //thereby
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: AppColor.primary),
      toolbarTextStyle:
          TextStyle(fontSize: 18.0, color: AppColor.white),
      titleTextStyle: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      ),
      // backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    //  scaffoldBackgroundColor: Colors.white
    textTheme: _lightTextTheme,
  );

//text theme for dark theme
  /*static final TextStyle _darkScreenHeadingTextStyle =
      _lightScreenHeadingTextStyle.copyWith(color: AppColor.darkTextColor);
  static final TextStyle _darkScreenTaskNameTextStyle =
      _lightScreenTaskNameTextStyle.copyWith(color: AppColor.darkTextColor);
  static final TextStyle _darkScreenTaskDurationTextStyle =
      _lightScreenTaskDurationTextStyle;
  static final TextStyle _darkScreenButtonTextStyle = TextStyle(
      fontSize: 14.0, color: AppColor.darkTextColor, fontWeight: FontWeight.w500);
  static final TextStyle _darkScreenCaptionTextStyle = TextStyle(
      fontSize: 12.0,
      color: AppColor.darkBackgroundAppBarColor,
      fontWeight: FontWeight.w100);*/

  static const TextTheme _darkTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 20.0, color: AppColor.darkTextColor),
    bodyText1: TextStyle(fontSize: 16.0, color: AppColor.darkTextColor),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey),
    button: TextStyle(
        fontSize: 15.0,
        color: AppColor.darkTextColor,
        fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 16.0, color: AppColor.darkTextColor),
    subtitle1: TextStyle(fontSize: 16.0, color: AppColor.darkTextColor),
    caption:
        TextStyle(fontSize: 12.0, color: AppColor.darkBackgroundAppBarColor),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, //prefix icon color form input on focus
    fontFamily: font,
    // scaffoldBackgroundColor: AppColor.darkBackgroundColor,
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: AppColor.darkPrimaryColor,
    // ),
    appBarTheme: const AppBarTheme(
      color: AppColor.darkBackgroundAppBarColor,
      iconTheme: IconThemeData(color: AppColor.darkTextColor),
      titleTextStyle: TextStyle(fontSize: 16.0, color: AppColor.darkTextColor),
    ),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white),
        backgroundColor: AppColor.darkBackgroundAlertColor,
        actionTextColor: AppColor.darkBackgroundActionTextColor),
    iconTheme: const IconThemeData(
      color: AppColor.darkIconColor, //AppColor.darkIconColor,
    ),
    popupMenuTheme:
        const PopupMenuThemeData(color: AppColor.darkBackgroundAppBarColor),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        buttonColor: Colors.red,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: AppColor.darkPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      prefixStyle: TextStyle(color: AppColor.darkIconColor),
      //labelStyle: TextStyle(color: nevada),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.darkBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.darkBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      fillColor: AppColor.darkInputFillColor,
      //focusColor: _darkBorderActiveColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColor.darkPrimaryColor,
      primaryContainer: AppColor.darkBackgroundColor,
      // secondary: _darkSecondaryColor,
    ).copyWith(secondary: AppColor.darkPrimaryColor),
  );
}
