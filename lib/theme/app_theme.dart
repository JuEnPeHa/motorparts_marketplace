import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  final AppThemeColors colors = AppThemeColors(
    primary: Color(0xFF0D47A1),
    secondary: Color(0xFF1976D2),
    error: Color(0xFFB00020),
    background: Color(0xFFECEFF1),
    surface: Color(0xFFD6EFED),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
    onBackground: Color(0xFF000000),
    onSurface: Color(0xFF000000),
    info: Color(0xFF2196F3),
    success: Color(0xFF4CAF50),
    warning: Color(0xFFFFC107),
    shadowColor: Color(0xFF000000),
    cardColor: Color(0xFF1E88E5),
  );

  final AppThemeTextStyles textStyles = AppThemeTextStyles(
    headline1: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: Color(0xFF000000),
    ),
    headline2: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: Color(0xFF000000),
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Color(0xFF000000),
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );

  static final AppTheme _instance = AppTheme._();

  factory AppTheme() {
    return _instance;
  }

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    cardColor: _instance.colors.cardColor,
    primaryColor: _instance.colors.primary,
    secondaryHeaderColor: _instance.colors.secondary,
    errorColor: _instance.colors.error,
    backgroundColor: _instance.colors.background,
    scaffoldBackgroundColor: _instance.colors.surface,
    textTheme: ThemeData.light()
        .textTheme
        .copyWith(
          headline1: _instance.textStyles.headline1,
          headline2: _instance.textStyles.headline2,
          headline3: _instance.textStyles.headline3,
          headline4: _instance.textStyles.headline4,
          headline5: _instance.textStyles.headline5,
          headline6: _instance.textStyles.headline6,
          subtitle1: _instance.textStyles.subtitle1,
          subtitle2: _instance.textStyles.subtitle2,
          bodyText1: _instance.textStyles.bodyText1,
          bodyText2: _instance.textStyles.bodyText2,
          button: _instance.textStyles.button,
          caption: _instance.textStyles.caption,
          overline: _instance.textStyles.overline,
        )
        .apply(
          bodyColor: _instance.colors.onBackground,
          displayColor: _instance.colors.onBackground,
        ),
    colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: _instance.colors.primary,
          secondary: _instance.colors.secondary,
          error: _instance.colors.error,
          background: _instance.colors.background,
          surface: _instance.colors.surface,
          onPrimary: _instance.colors.onPrimary,
          onSecondary: _instance.colors.onSecondary,
          onError: _instance.colors.onError,
          onBackground: _instance.colors.onBackground,
          onSurface: _instance.colors.onSurface,
          primaryVariant: _instance.colors.info,
          secondaryVariant: _instance.colors.success,
          brightness: Brightness.light,
        ),
    shadowColor: _instance.colors.shadowColor,
  );

  // static const Color primary = Color.fromARGB(179, 158, 117, 90);
  // static final ThemeData lightTheme = ThemeData.light().copyWith(
  //     // Color primario
  //     primaryColor: Color.fromARGB(255, 45, 61, 146),
  //     // AppBar Theme
  //     appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  //     // TextButton Theme
  //     textButtonTheme:
  //         TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
  //     // FloatingActionButtons
  //     floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //         backgroundColor: primary, elevation: 5),
  //     backgroundColor: Colors.blueGrey.shade200,
  //     scaffoldBackgroundColor: Colors.blueGrey.shade200,
  //     dialogBackgroundColor: Colors.blueGrey.shade200,
  //     // ElevatedButtons
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //           primary: Color.fromARGB(
  //               primary.alpha + 50.clamp(0, 255),
  //               primary.red + 50.clamp(0, 255),
  //               primary.green + 50.clamp(0, 255),
  //               primary.blue + 50.clamp(0, 255)),
  //           shape: const StadiumBorder(),
  //           elevation: 0),
  //     ),
  //     inputDecorationTheme: const InputDecorationTheme(
  //       filled: true,
  //       fillColor: Colors.white38,
  //       floatingLabelStyle: TextStyle(color: primary),
  //       enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: primary),
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10),
  //               bottomRight: Radius.circular(10),
  //               bottomLeft: Radius.circular(20),
  //               topRight: Radius.circular(20))),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: primary),
  //           borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(10),
  //               topRight: Radius.circular(10))),
  //       border: OutlineInputBorder(
  //           borderRadius: BorderRadius.only(
  //               bottomLeft: Radius.circular(10),
  //               topRight: Radius.circular(10))),
  //     ));

  // static final ThemeData darkTheme = ThemeData.dark().copyWith(
  //     // Color primario
  //     primaryColor: Colors.indigo,
  //     // AppBar Theme
  //     appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  //     scaffoldBackgroundColor: Colors.black);
}

class AppThemeTextStyles {
  AppThemeTextStyles({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.headline5,
    required this.headline6,
    required this.subtitle1,
    required this.subtitle2,
    required this.bodyText1,
    required this.bodyText2,
    required this.button,
    required this.caption,
    required this.overline,
  });

  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle headline5;
  final TextStyle headline6;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle bodyText1;
  final TextStyle bodyText2;
  final TextStyle button;
  final TextStyle caption;
  final TextStyle overline;
  final TextStyle defaultStyle1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: Colors.black,
  );

  TextStyle get headline => headline1;
  TextStyle get subtitle => subtitle1;
  TextStyle get body => bodyText1;
  TextStyle get caption1 => caption;
  TextStyle get defaultStyle => defaultStyle1;
}

class AppThemeColors {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onBackground;
  final Color onSurface;
  final Color onError;
  final Color shadowColor;
  final Color success;
  final Color warning;
  final Color info;
  final Color cardColor;

  const AppThemeColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.error,
    required this.onPrimary,
    required this.onSecondary,
    required this.onBackground,
    required this.onSurface,
    required this.onError,
    required this.shadowColor,
    required this.success,
    required this.warning,
    required this.info,
    required this.cardColor,
  });

  static AppThemeColors of(BuildContext context) {
    final theme = Theme.of(context);
    return AppThemeColors(
      primary: theme.primaryColor,
      secondary: ColorScheme.light().secondary,
      background: theme.backgroundColor,
      surface: theme.cardColor,
      error: theme.errorColor,
      onPrimary: theme.primaryColorLight,
      onSecondary: ColorScheme.light().onSecondary,
      onBackground: theme.backgroundColor,
      onSurface: theme.cardColor,
      onError: theme.errorColor,
      shadowColor: theme.shadowColor,
      success: Colors.green,
      warning: Colors.orange,
      info: Colors.blue,
      cardColor: theme.cardColor,
    );
  }

  static AppThemeColors light() {
    return AppThemeColors(
      primary: Color.fromARGB(255, 45, 61, 146),
      secondary: ColorScheme.light().secondary,
      background: Colors.blueGrey.shade200,
      surface: Colors.blueGrey.shade200,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: ColorScheme.light().onSecondary,
      onBackground: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
      shadowColor: Colors.black,
      success: Colors.green,
      warning: Colors.orange,
      info: Colors.blue,
      cardColor: Colors.white,
    );
  }

  static AppThemeColors dark() {
    return AppThemeColors(
      primary: Colors.indigo,
      secondary: ColorScheme.dark().secondary,
      background: Colors.black,
      surface: Colors.black,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: ColorScheme.dark().onSecondary,
      onBackground: Colors.white,
      onSurface: Colors.white,
      onError: Colors.white,
      shadowColor: Colors.white,
      success: Colors.green,
      warning: Colors.orange,
      info: Colors.blue,
      cardColor: Colors.black,
    );
  }

  static AppThemeColors from(ColorScheme colorScheme) {
    return AppThemeColors(
      primary: colorScheme.primary,
      secondary: colorScheme.secondary,
      background: colorScheme.background,
      surface: colorScheme.surface,
      error: colorScheme.error,
      onPrimary: colorScheme.onPrimary,
      onSecondary: colorScheme.onSecondary,
      onBackground: colorScheme.onBackground,
      onSurface: colorScheme.onSurface,
      onError: colorScheme.onError,
      shadowColor: colorScheme.shadow.alpha == 0
          ? Colors.black
          : colorScheme.shadow, // TODO: check this
      success: Colors.green,
      warning: Colors.orange,
      info: Colors.blue,
      cardColor: Colors.white,
    );
  }

  AppThemeColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? error,
    Color? onPrimary,
    Color? onSecondary,
    Color? onBackground,
    Color? onSurface,
    Color? onError,
    Color? shadowColor,
    Color? success,
    Color? warning,
    Color? info,
    Color? cardColor,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onBackground: onBackground ?? this.onBackground,
      onSurface: onSurface ?? this.onSurface,
      onError: onError ?? this.onError,
      shadowColor: shadowColor ?? this.shadowColor,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      cardColor: cardColor ?? this.cardColor,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemeColors &&
          runtimeType == other.runtimeType &&
          primary == other.primary &&
          secondary == other.secondary &&
          background == other.background &&
          surface == other.surface &&
          error == other.error &&
          onPrimary == other.onPrimary &&
          onSecondary == other.onSecondary &&
          onBackground == other.onBackground &&
          onSurface == other.onSurface &&
          onError == other.onError &&
          shadowColor == other.shadowColor &&
          success == other.success &&
          warning == other.warning &&
          info == other.info &&
          cardColor == other.cardColor;

  @override
  int get hashCode =>
      primary.hashCode ^
      secondary.hashCode ^
      background.hashCode ^
      surface.hashCode ^
      error.hashCode ^
      onPrimary.hashCode ^
      onSecondary.hashCode ^
      onBackground.hashCode ^
      onSurface.hashCode ^
      onError.hashCode ^
      shadowColor.hashCode ^
      success.hashCode ^
      warning.hashCode ^
      info.hashCode ^
      cardColor.hashCode;

  @override
  String toString() {
    return 'AppThemeColors(primary: $primary, secondary: $secondary, background: $background, surface: $surface, error: $error, onPrimary: $onPrimary, onSecondary: $onSecondary, onBackground: $onBackground, onSurface: $onSurface, onError: $onError, shadowColor: $shadowColor, success: $success, warning: $warning, info: $info)';
  }

  AppThemeColors.fromJson(Map<String, dynamic> json)
      : primary = Color(json['primary'] as int),
        secondary = Color(json['secondary'] as int),
        background = Color(json['background'] as int),
        surface = Color(json['surface'] as int),
        error = Color(json['error'] as int),
        onPrimary = Color(json['onPrimary'] as int),
        onSecondary = Color(json['onSecondary'] as int),
        onBackground = Color(json['onBackground'] as int),
        onSurface = Color(json['onSurface'] as int),
        onError = Color(json['onError'] as int),
        shadowColor = Color(json['shadowColor'] as int),
        success = Color(json['success'] as int),
        warning = Color(json['warning'] as int),
        info = Color(json['info'] as int),
        cardColor = Color(json['cardColor'] as int);

  Map<String, dynamic> toJson() => {
        'primary': primary.value,
        'secondary': secondary.value,
        'background': background.value,
        'surface': surface.value,
        'error': error.value,
        'onPrimary': onPrimary.value,
        'onSecondary': onSecondary.value,
        'onBackground': onBackground.value,
        'onSurface': onSurface.value,
        'onError': onError.value,
        'shadowColor': shadowColor.value,
        'success': success.value,
        'warning': warning.value,
        'info': info.value,
        'cardColor': cardColor.value,
      };

  AppThemeColors clone() => AppThemeColors.fromJson(toJson());

  AppThemeColors merge(AppThemeColors other) {
    if (other == null) return this;
    return copyWith(
      primary: other.primary,
      secondary: other.secondary,
      background: other.background,
      surface: other.surface,
      error: other.error,
      onPrimary: other.onPrimary,
      onSecondary: other.onSecondary,
      onBackground: other.onBackground,
      onSurface: other.onSurface,
      onError: other.onError,
      shadowColor: other.shadowColor,
      success: other.success,
      warning: other.warning,
      info: other.info,
      cardColor: other.cardColor,
    );
  }
}
