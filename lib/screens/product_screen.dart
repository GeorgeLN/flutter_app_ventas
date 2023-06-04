//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:seguridad_clientes_app/ui/input_decortations.dart';
import 'package:seguridad_clientes_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( //Widget por excelencia a la hora de crear formularios.
        child: Column(
          children: [
            
            Stack(
              children: [
                const ProductImage(),

                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 40, color: Colors.white),

                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                Positioned(
                  top: 60,
                  right: 30,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt, size: 40, color: Colors.white),

                    onPressed: () {
                      //TODO: Abrir la cámara o la galería de imagenes.
                    },
                  ),
                ),
              ],
            ),

            const _ProductForm(),

            const SizedBox(height: 100), //Añade más espacio al Scroll.
          ], //Children[].
        ),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 250,
    
        decoration: _buildBoxDecoration(),

        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 10),

              TextFormField(
                autocorrect: false,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre producto',
                  labelText: 'Nombre',
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                keyboardType: TextInputType.number, //Teclado de sólo números.
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150',
                  labelText: 'Precio',
                ),
              ),

              const SizedBox(height: 15),

              SwitchListTile.adaptive(
                value: true,

                onChanged: (value) {
                  
                },
              ),
            ], //Children[]
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,


      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.09),
          offset: const Offset(0, 9),
          blurRadius: 5,
        ),
      ], //BoxShadow[]
    );
  }
}