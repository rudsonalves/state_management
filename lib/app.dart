import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/settings_page.dart';
import './theme/theme.dart';
import './pages/home_page.dart';
import './models/counter.dart';
import './models/limited_counter.dart';
import './models/person.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter>(create: (_) => Counter()),
        Provider<LimitedCounter>(create: (_) => LimitedCounter()),
        Provider<Person>(create: (_) => Person()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          SettingsPage.routeName: (context) => const SettingsPage(),
        },
      ),
    );
  }
}
