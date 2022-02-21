import 'package:flutter/material.dart';
import 'package:ioasys_pokedex/app/core/theme/theme.dart';
import 'pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomePage(),
      },
    );
  }
}
