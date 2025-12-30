import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary Brand Colors (Fresh, Modern & Organic)
  static const Color primary = Color(0xFF00797E);
  static const Color primaryLight = Color(0xFF4DB6AC);
  static const Color primaryDark = Color(0xFF00796B);

  // Secondary/Accent Colors
  static const Color secondary = Color(0xFFFF6F00);
  static const Color secondaryLight = Color(0xFFFFB74D);
  static const Color secondaryDark = Color(0xFFE65100);

  // Neutral Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFFBC02D);
  static const Color info = Color(0xFF1976D2);

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1C1E);
  static const Color textSecondary = Color(0xFF44474E);
  static const Color textTertiary = Color(0xFF74777F);
  static const Color textOnPrimary = Colors.white;

  // UI Elements
  static const Color border = Color(0xFFDEE2E6);
  static const Color borderLight = Color(0xFFEDF2F7);
  static const Color divider = Color(0xFFE9ECEF);
  static const Color selectionTint = Color(0xFFF0F7F4);
  static const Color shadow = Color(0x0A000000);

  // Derived Selection Colors
  static Color get highlight => primary.withValues(alpha: 0.08);
  static Color get splash => primary.withValues(alpha: 0.12);
  static Color get hover => primary.withValues(alpha: 0.04);
}

class AppTheme {
  static const double _borderRadius = 14.0;
  static const double _cardRadius = 24.0;
  static const double pagePaddingHorizontal = 16.0;
  static const double pagePaddingVertical = 8.0;

  static ThemeData get lightTheme {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      error: AppColors.error,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.selectionTint,
      outline: AppColors.border,
      brightness: Brightness.light,
    );

    final TextTheme textTheme = TextTheme(
      // Display: Large titles for hero sections
      displayLarge: GoogleFonts.outfit(
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      ),
      displayMedium: GoogleFonts.outfit(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      displaySmall: GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),

      // Headlines: Section headers
      headlineLarge: GoogleFonts.outfit(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      headlineMedium: GoogleFonts.outfit(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      headlineSmall: GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),

      // Titles: Component headers
      titleLarge: GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      titleMedium: GoogleFonts.outfit(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),
      titleSmall: GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
      ),

      // Body: Main content
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        color: AppColors.textPrimary,
        height: 1.2,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        color: AppColors.textSecondary,
        height: 1.2,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: 12,
        color: AppColors.textTertiary,
        height: 1.4,
      ),

      // Labels: Captions, small metadata
      labelLarge: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        color: AppColors.textTertiary,
        letterSpacing: 0.5,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColors.background,

      // Component Interactions
      splashColor: AppColors.splash,
      highlightColor: AppColors.highlight,
      hoverColor: AppColors.hover,

      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: false,
        titleTextStyle: textTheme.headlineMedium,
        iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              minimumSize: const Size(88, 48),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              shape: const StadiumBorder(),
              textStyle: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
              ),
              iconSize: 20,
              elevation: 0,
            ).copyWith(
              elevation: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) return 2;
                if (states.contains(WidgetState.hovered)) return 6;
                return 4;
              }),
              shadowColor: WidgetStateProperty.all(
                AppColors.primary.withValues(alpha: 0.35),
              ),
            ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style:
            FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              minimumSize: const Size(88, 48),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              shape: const StadiumBorder(),
              textStyle: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
              ),
              iconSize: 20,
              elevation: 0,
            ).copyWith(
              elevation: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) return 2;
                if (states.contains(WidgetState.hovered)) return 6;
                return 4;
              }),
              shadowColor: WidgetStateProperty.all(
                AppColors.primary.withValues(alpha: 0.35),
              ),
            ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(88, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          shape: const StadiumBorder(),
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          textStyle: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
          iconSize: 20,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(64, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          shape: const StadiumBorder(),
          textStyle: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          iconSize: 20,
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.all(8),
          shape: const StadiumBorder(),
        ),
      ),

      // Cards
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
          side: const BorderSide(color: AppColors.borderLight),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        clipBehavior: Clip.antiAlias,
      ),

      // Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.border),
          gapPadding: 8,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.border),
          gapPadding: 8,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
          gapPadding: 8,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.error),
          gapPadding: 8,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
          gapPadding: 8,
        ),
        labelStyle: textTheme.bodyLarge?.copyWith(
          color: AppColors.textSecondary,
          height: 1,
        ),
        floatingLabelStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.primary,
          height: 1,
          fontWeight: FontWeight.w600,
        ),
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: AppColors.textTertiary,
          height: 1.2,
        ),
        errorStyle: textTheme.bodySmall?.copyWith(color: AppColors.error),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),

      // Dialogs
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
        titleTextStyle: textTheme.displaySmall,
        contentTextStyle: textTheme.bodyLarge,
      ),

      // Bottom Sheets
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        elevation: 16,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_cardRadius),
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Chips
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface,
        disabledColor: AppColors.divider.withValues(alpha: 0.5),
        selectedColor: AppColors.primary,
        secondarySelectedColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        labelStyle: textTheme.labelLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        shape: const StadiumBorder(),
        side: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.1),
          width: 1.5,
        ),
        showCheckmark: false,
        elevation: 0,
        pressElevation: 4,
        shadowColor: AppColors.primary.withValues(alpha: 0.3),
      ),

      // List Tiles
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        minLeadingWidth: 24,
        iconColor: AppColors.textSecondary,
        textColor: AppColors.textPrimary,
        titleTextStyle: textTheme.titleLarge,
        subtitleTextStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Tabs
      tabBarTheme: TabBarThemeData(
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textSecondary,
        labelStyle: textTheme.titleLarge,
        unselectedLabelStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.normal,
        ),
        dividerColor: Colors.transparent,
        indicator: UnderlineTabIndicator(
          borderSide: const BorderSide(color: AppColors.primary, width: 3),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(3)),
        ),
      ),

      // Floating Action Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),

      // Icons
      iconTheme: const IconThemeData(color: AppColors.textSecondary, size: 24),

      // Dividers
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 16,
      ),

      // Date Picker
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.surface,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
        headerBackgroundColor: AppColors.primary,
        headerForegroundColor: AppColors.textOnPrimary,
        headerHeadlineStyle: textTheme.displaySmall?.copyWith(
          color: AppColors.textOnPrimary,
        ),
        dayStyle: textTheme.bodyLarge,
        todayForegroundColor: WidgetStateProperty.all(AppColors.primary),
        todayBackgroundColor: WidgetStateProperty.all(Colors.transparent),
        todayBorder: const BorderSide(color: AppColors.primary, width: 1.5),
        dayForegroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.textOnPrimary;
          }
          if (states.contains(WidgetState.disabled)) {
            return AppColors.textTertiary.withValues(alpha: 0.4);
          }
          return AppColors.textPrimary;
        }),
        dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return Colors.transparent;
        }),
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.divider,
        refreshBackgroundColor: AppColors.surface,
      ),

      // Popup Menu
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: textTheme.bodyLarge,
      ),

      // Checkbox
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary;
          return Colors.transparent;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(color: AppColors.textTertiary, width: 2),
      ),
    );
  }
}
