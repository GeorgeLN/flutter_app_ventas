import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seguridad_clientes_app/screens/screens.dart';
import 'package:seguridad_clientes_app/services/products_services.dart';
import 'package:seguridad_clientes_app/themes/app_theme.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  //const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsServices(),
        ),
      ],

      child: const MyApp(), //providers[]
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Se desactiva la etiqueta del debug.
      title: 'Inicio',
      initialRoute: 'login',

      routes: {
        'login':   (context) => const LoginScreen(),
        'home':    (context) => const HomeScreen(),
        'product': (context) => const ProductScreen(),
      },

      theme: AppTheme.lightTheme,
    );
  }
}