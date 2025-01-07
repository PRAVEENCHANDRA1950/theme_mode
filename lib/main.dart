import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode/screens/home.dart';
import 'package:theme_mode/theme/theme.dart';
import 'package:theme_mode/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Providing the ThemeProvider
      child: const MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;

    // Schedule the theme update after the build phase is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Update theme based on system brightness (after build phase is done)
      Provider.of<ThemeProvider>(context, listen: false)
          .setSystemTheme(systemBrightness);
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      // Using themeData from ThemeProvider
      theme: Provider.of<ThemeProvider>(context)
          .themeData, // Access themeData from provider
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Theme'),
    );
  }
}
