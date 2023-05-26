import 'package:flutter/material.dart';

import 'package:seguridad_clientes_app/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
   
  static const String routerName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Nombre APP'),
        centerTitle: true,
      ),

      drawer: const SideMenu(),
    );
  }
}