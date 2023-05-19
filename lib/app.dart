import 'package:flutter/material.dart';

import './pages/settings_page.dart';
import './theme/theme.dart';
import './pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingsPage.routeName: (context) => const SettingsPage(),
      },
    );
  }
}
