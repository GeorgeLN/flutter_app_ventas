//import 'dart:ffi';
// ignore_for_file: unused_local_variable, deprecated_member_use, sort_child_properties_last, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:seguridad_clientes_app/services/services.dart';
import 'package:seguridad_clientes_app/providers/product_form_provider.dart';
import 'package:seguridad_clientes_app/ui/input_decortations.dart';
import 'package:seguridad_clientes_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productServices = Provider.of<ProductsServices>(context);

    return ChangeNotifierProvider(
      create: (context) => ProductFormProvider( productServices.selectedProduct ),

      child: _ProductScreenBody(productServices: productServices),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    super.key,
    required this.productServices,
  });

  final ProductsServices productServices;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView( //Widget por excelencia a la hora de crear formularios.
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //Se oculta el teclado al momento de hacer "Scroll" en la pantalla principal.
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage( url: productServices.selectedProduct.picture ),

                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 40, color: Colors.white),
                    tooltip: 'Regresar',

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
                    tooltip: 'Tomar foto',

                    onPressed: () async {
                      final picker = ImagePicker();
                      final PickedFile? pickedFile = await picker.getImage(
                        source: ImageSource.camera,
                        imageQuality: 100,
                      );

                      if ( pickedFile == null ) {
                        return ;
                      }

                      productServices.updateSelectedProductImage(pickedFile.path);
                    },
                  ),
                ),

                Positioned(
                  top: 120,
                  right: 30,

                  child: IconButton(
                    icon: const Icon(Icons.image_search, size: 40, color: Colors.white),
                    tooltip: 'Abrir galería',

                    onPressed: () async {
                      final picker = ImagePicker();
                      final PickedFile? pickedFile = await picker.getImage(
                        source: ImageSource.gallery,
                        imageQuality: 100,
                      );

                      if ( pickedFile == null ) {
                        return ;
                      }

                      productServices.updateSelectedProductImage(pickedFile.path);
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

      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Guardar cambios',
        backgroundColor: Colors.blue[900],

        child: productServices.isSaving
          ? const CircularProgressIndicator( strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white) )
          : const Icon(Icons.save, size: 30),

        onPressed: productServices.isSaving
          ? null
          : () async {
            if ( !productForm.isValidForm() ) { //Validamos que el formulario sea válido.
              return ;
            }

            final String? imageUrl = await productServices.uploadImage();

            if ( imageUrl != null ) {
              productForm.product.picture = imageUrl;
            }

            await productServices.saveOrCreateProduct(productForm.product);
            //const _AlertMessage(); //Mensaje que notifica el éxito a la hora de guardar un producto.
          },
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

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 250,
    
        decoration: _buildBoxDecoration(),

        child: Form(
          key: productForm.formKey,

          child: Column(
            children: [
              const SizedBox(height: 10),

              TextFormField(
                initialValue: product.name,
                autocorrect: false,

                onChanged:(value) {
                  product.name = value;
                },

                validator: (value) {
                  if ( value == null && value!.length > 1) {
                    return 'El nombre es obligatorio';
                  }
                },

                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre producto',
                  labelText: 'Nombre',
                ),
              ),

              const SizedBox(height: 15),

              TextFormField(
                initialValue: '${product.price}',
                keyboardType: TextInputType.number, //Teclado de sólo números.

                inputFormatters: [
                  FilteringTextInputFormatter.allow( RegExp(r'^(\d+)?\.?\d{0,2}') )
                ],

                onChanged:(value) {
                  if ( double.tryParse(value) == null ) {
                    product.price = 0;  
                  }
                  else {
                    product.price = double.parse(value);
                  }
                },

                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150',
                  labelText: 'Precio',
                ),
              ),

              const SizedBox(height: 15),

              SwitchListTile.adaptive(
                value: product.available,
                title: const Text('Dsponible', style: TextStyle(fontWeight: FontWeight.bold)),
                onChanged: productForm.updateAvailability,
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