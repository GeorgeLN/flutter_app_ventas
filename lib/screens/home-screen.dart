import 'package:flutter/material.dart';

import 'package:seguridad_clientes_app/widgets/widgets.dart';

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

      body: ListView.builder(
        itemCount: 10,

        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'product');
          },
          
          child: const ProductCard(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          
        },
      ),

      //DRAWER 
      drawer: const SideMenu(),
    );
  }
}