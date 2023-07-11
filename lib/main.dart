import 'package:flutter/material.dart';
import 'package:menu_demo/provider/theme_provider.dart';
import 'package:menu_demo/provider/wine_provider.dart';
import 'package:menu_demo/view/main_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WineProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return MaterialApp(
            theme: theme.themeData,
            debugShowCheckedModeBanner: false,
            home: const MainView(),
            title: 'Menu',
          );
        },
      ),
    );
  }
}
