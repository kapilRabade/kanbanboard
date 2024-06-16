import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
  //  accentColor: AppColors.secondary,

    scaffoldBackgroundColor: AppColors.backgroundLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: AppTextThemes.workSansLight,
    dividerColor: AppColors.surfaceLight,
    dividerTheme: DividerThemeData(thickness: 1),
  );

  static final appThemeDark = ThemeData(
    primaryColor: AppColors.primary,
   // accentColor: AppColors.secondary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    brightness: Brightness.dark,
    textTheme: AppTextThemes.workSansDark,
    dividerColor: AppColors.surfaceDark,
    dividerTheme: DividerThemeData(thickness: 1),
  );

  static final upwardsBoxShadow = BoxShadow(
      color: Color.fromARGB(25, 21, 28, 42),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(0, -2));

  static Brightness? get currentSystemBrightness =>
      SchedulerBinding.instance?.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? AppColors.backgroundLight
          : AppColors.backgroundDark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

class AppColors {
  static const primary = Color(0xFFFFFFFF);
  static const primaryVariant = Color(0xFFf5f5f5);
  static const secondary = Color(0xFF1260cc);
  static const secondaryShade = Color(0xFFFFCC00);



  //static const backgroundLight = surfaceLight;
  static const backgroundLight = Color(0xFFF4F4F4);
  static const backgroundDark = Color(0xFF1F2B2D);

  static const surfaceLight = Color(0xffdbdada);
  static const surfaceDark = Color(0xFF0E272D);

  static const TextColorLight = Color(0xFF828280);
  static const lightpurple = Color(0xFF9BA1FB);

  static const coolGray2 = Color(0xFFA8ABB1);
  static const coolGray3 = Color(0xFF454A54);
  static const coolGray5 = Color(0xFF575757);

  static const iconColorLight = Color(0xFFF5F5F5);
  static const iconColorDark = Color(0xFF333333);


  static const error = Color(0xFFB00020);

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static final grey = Colors.grey.shade50;

  static const darkGrey = Color(0xFF333333);
  static const borderGrey = Color(0xFFAFAFAF);
  static const lightBlue = Color(0xFFAEB2FF);
  static const lightGreen = Color(0xFF01E847);
  static const lightGreenOne = Color(0xFFD0ECD9);
  static const transparent = Color(0xFFFFFF);
  static const lightYellowone = Color(0xFFFF8E9BC);

  // static const buttonBlue = Color(0xFF3d4296);
 static const buttonBlue = Color(0xFF004AAD);
  static const buttonLightBlue = Color(0xffc4c6e7);
  static const buttonRed = Color(0xFFDE2222);
  static const deleteRed= Color(0xFFB80000);
  static const drawerBackground = Color(0xFF004AAD);

  //static const buttonYello = Color(0xFFFFCC00);
  static const buttonYello = Color(0xFFf8d418);

}

class Dimens {
  static const double margin_2dp = 2;
  static const double margin_4dp = 4;
  static const double margin_6dp = 6;
  static const double margin_8dp = 8;
  static const double margin_10dp = 10.0;
  static const double margin_12dp = 12.0;
  static const double margin_16dp = 16.0;
  static const double margin_18dp = 18.0;
  static const double margin_20dp = 20.0;
  static const double margin_24dp = 24.0;
  static const double margin_32dp = 32.0;
  static const double margin_40dp = 40.0;
  static const double margin_48dp = 48.0;
  static const double margin_100dp = 100.0;

  static const double padding_2dp = 2.0;
  static const double padding_4dp = 4.0;
  static const double padding_6dp = 6.0;
  static const double padding_8dp = 8.0;
  static const double padding_10dp = 10.0;
  static const double padding_12dp = 12.0;
  static const double padding_14dp = 14.0;
  static const double padding_16dp = 16.0;
  static const double padding_18dp = 18.0;
  static const double padding_20dp = 20.0;
  static const double padding_24dp = 24.0;
  static const double padding_30dp = 30.0;
  static const double padding_32dp = 32.0;
  static const double padding_40dp = 40.0;
  static const double padding_48dp = 48.0;
  static const double padding_56dp = 56.0;
  static const double padding_70dp = 70.0;
  static const double padding_100dp = 100.0;
  static const double padding_200dp = 200.0;


  static const double font_10sp = 10.0;
  static const double font_12sp = 12.0;
  static const double font_14sp = 14.0;
  static const double font_16sp = 16.0;
  static const double font_18sp = 18.0;
  static const double font_20sp = 20.0;
  static const double font_22sp = 22.0;
  static const double font_24sp = 24.0;
  static const double font_28sp = 28.0;

  static const double radius_10dp = 10;
  static const double radius_8dp = 8;
  static const double radius_6dp = 6;
  static const double radius_4dp = 4;
  static const double radius_12dp = 12;
  static const double radius_14dp = 14;
  static const double radius_16dp = 16;
  static const double radius_24dp = 24;

  static const double pb_width_48dp = 48;
  static const double pb_height_48dp = 48;

  static const double et_width_70dp = 70;
  static const double et_width_100dp = 100;
  static const double et_width_150dp = 150;

  static const double et_height_18dp = 18;
  static const double et_height_32dp = 32;
  static const double et_height_40dp = 40;
  static const double et_height_50dp = 50;
  static const double et_height_300dp = 300;

  static const double btn_width_32dp = 32;
  static const double btn_width_40dp = 40;
  static const double btn_width_48dp = 48;
  static const double btn_width_90dp = 90;
  static const double btn_width_150dp = 150;
  static const double btn_width_110dp = 110;
  static const double btn_width_200dp = 200;

  static const double btn_height_18dp = 18;
  static const double btn_height_32dp = 32;
  static const double btn_height_40dp = 40;
  static const double btn_height_48dp = 48;

  static const double elevation_8dp = 8;

  static const double avatar_radius_20dp = 20;
  static const double avatar_radius_48dp = 48;
  static const double avatar_radius_56dp = 56;

  static const double avatar_width_40dp = 40;
  static const double avatar_width_90dp = 90;
  static const double avatar_width_100dp = 100;

  static const double avatar_height_40dp = 40;
  static const double avatar_height_44dp = 44;
  static const double avatar_height_90dp = 90;
  static const double avatar_height_100dp = 100;

  static const double toolbar_height = 56;
  static const double tab_bar_height = 56;
  //static const double bottom_nav_bar_height = 60;
  static const double bottom_nav_bar_height = 60;
  static const double stepper_height = 124;

  static const double divider_height_1dp = 1;
  static const double divider_height_3dp = 3;
  static const double divider_height_02dp = 0.2;

  static const double border_1dp = 1;
  static const double border_1_5dp = 1.5;
  static const double border_2dp = 2;

  static const double placeholder_size_48dp = 48;

  static const double icon_size_16 = 16;

  static const double dialog_max_width = 500;
  static const double alert_dialog_max_width = 200;
  static const double alert_dialog_guest_checkout_width=292;
}

class AppTextThemes {
  static TextTheme workSansLight =
      GoogleFonts.workSansTextTheme(textThemeLight);
  static TextTheme workSansDark = GoogleFonts.workSansTextTheme(textThemeDark);
  static TextTheme textThemeLight = TextTheme(
    headline1: h1,
    headline2: h2,
    headline3: h3,
    headline4: h4,
    headline5: h5,
    headline6: h6,
    bodyText1: bodyText1,
    bodyText2: bodyText2,
    button: button,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    caption: caption,
    overline: overline,
  );

  static TextTheme textThemeDark = TextTheme(
    headline1: h1Dark,
    headline2: h2Dark,
    headline3: h3Dark,
    headline4: h4Dark,
    headline5: h5Dark,
    headline6: h6Dark,
    bodyText1: bodyTextDark,
    bodyText2: bodyText2Dark,
    button: buttonDark,
    subtitle1: subtitle1Dark,
    subtitle2: subtitle2Dark,
    caption: captionDark,
    overline: overlineDark,
  );

  static final h1 = TextStyle(
      fontSize: 48, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h2 = TextStyle(
      fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h3 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h4 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h5 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black);
  static final h6 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.black);
  static final subtitle1 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.black);
  //static final bodyText1 = TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.black);
  static final bodyText1 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black);
  static final bodyText2 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black);
  static final button = TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.white);
  static final subtitle2 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.black);
  static final caption = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black);
  static final overline = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      letterSpacing: 0.1);

  static final labelStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.secondary);

  static final h1Dark = h1.copyWith(color: AppColors.white);
  static final h2Dark = h2.copyWith(color: AppColors.white);
  static final h3Dark = h3.copyWith(color: AppColors.white);
  static final h4Dark = h4.copyWith(color: AppColors.white);
  static final h5Dark = h5.copyWith(color: AppColors.white);
  static final h6Dark = h6.copyWith(color: AppColors.white);
  static final subtitle1Dark = subtitle1.copyWith(color: AppColors.white);
  static final bodyTextDark = bodyText1.copyWith(color: AppColors.white);
  static final bodyText2Dark = bodyText2.copyWith(color: AppColors.white);
  static final buttonDark = button.copyWith();
  static final subtitle2Dark = subtitle2.copyWith(color: AppColors.white);
  static final captionDark = caption.copyWith(color: AppColors.white);
  static final overlineDark = overline.copyWith(color: AppColors.white);
}

extension ThemeExtras on ThemeData {
  Color get appBarColor => this.brightness == Brightness.light
      ? AppColors.primary
      : AppColors.surfaceDark;

  Color get navBarColor => this.brightness == Brightness.light
      ? AppColors.surfaceLight
      : AppColors.surfaceDark;

  Color get textFieldBackgroundColor => this.brightness == Brightness.light
      ? AppColors.surfaceLight
      : AppColors.surfaceDark;

  Color get iconColor => this.brightness == Brightness.light
      ? AppColors.iconColorDark
      : AppColors.iconColorLight;

  TextStyle get labelStyle =>
      AppTextThemes.bodyText2.copyWith(color: AppColors.secondary);
}
