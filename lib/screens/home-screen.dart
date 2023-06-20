// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seguridad_clientes_app/models/models.dart';
import 'package:seguridad_clientes_app/screens/screens.dart';
import 'package:seguridad_clientes_app/services/services.dart';
import 'package:seguridad_clientes_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  static const String routerName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productService =  Provider.of<ProductsServices>(context);

    if (productService.isLoading == true) {
      return const LoadingScreen();
    }

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Productos'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: productService.products.length,

        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            productService.selectedProduct = productService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          
          child: ProductCard(
            product: productService.products[index],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: Colors.blue[900],
        child: const Icon(Icons.add_shopping_cart),
        
        onPressed: () {
          productService.selectedProduct = Product(
            available: true,
            name: '',
            price: 0,
          );

          Navigator.pushNamed(context, 'product');
        },
      ),

      //DRAWER 
      drawer: const SideMenu(),
    );
  }
}