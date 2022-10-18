import 'package:flutter/material.dart';

import 'package:peliculas/src/pages/pages.dart';
import 'package:peliculas/src/providers/movies_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

// En esta clase Se tendra en el estado de Peliculas Provider
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'details': (context) => const MovieDetailsPage(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
        ),
      ),
    );
  }
}
