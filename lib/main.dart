import 'package:flutter/material.dart';

import 'package:seguridad_clientes_app/screens/screens.dart';
import 'package:seguridad_clientes_app/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Se desactiva la etiqueta del debug.
      title: 'Inicio',
      initialRoute: 'home',

      routes: {
        'login':   (context) => const LoginScreen(),
        'home':    (context) => const HomeScreen(),
        'product': (context) => const ProductScreen(),
      },

      theme: AppTheme.lightTheme,
    );
  }
}