import 'package:app/importer.dart';

ThemeData customThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.light,
  ),
  dividerTheme: DividerThemeData(
    color: Colors.grey.shade300,
    thickness: 1,
  ),
);
