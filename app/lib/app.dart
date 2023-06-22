import 'package:app/importer.dart';

class LogSearchApp extends StatelessWidget {
  const LogSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Search App',
      theme: customThemeData,
      home: const HomePage(),
    );
  }
}
