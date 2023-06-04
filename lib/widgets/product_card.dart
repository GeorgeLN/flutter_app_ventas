//import 'dart:html';

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:seguridad_clientes_app/themes/app_theme.dart';

class ProductCard extends StatelessWidget {
   
  const ProductCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),// vertical: 50),

      child: Container(
        margin: const EdgeInsets.only(top: 35, bottom: 40),
        width: double.infinity,
        height: 400,
        //color: Colors.red,

        child: const Stack(
          alignment: Alignment.bottomLeft,

          children: [

            _BackgrounImage(),

            _ProducDetails(),

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(),
            ),

            //TODO: Mostrar de manera condicional, si está disponible se visualiza... De lo contrario no.
            Positioned(
              top: 0,
              left: 0,
              child: _NotAvailable(),
            ),
          ], //Children[]
        ),

        decoration: _cardDecoration(),
      ),
    );
  }

  //Decoración de la caja de los productos.
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),

        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 6),
            blurRadius: 10,
          ),
        ], //BoxShadow[]
      );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),

          child: Text('No disponible', style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),

      width: 100,
      height: 70,

      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25))
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox( //Widget que adecua el texto para que no se descuadre del container.
        fit: BoxFit.contain,

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$1.99', style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),

      width: 100,
      height: 70,
      alignment: Alignment.center,


      decoration: const BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
    );
  }
}

class _ProducDetails extends StatelessWidget {
  const _ProducDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,

        decoration: _buildBoxDecoration(),
    
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start, //Alineamiento HORIZONTAL
          children: [

            Text('Producto X',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
    
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Text('ID Producto X',
              style: TextStyle(
                fontSize: (12 + 1),
                color: Colors.white,
              ),
            ),
          ], //Children[]
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: AppTheme.primary,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );
}

class _BackgrounImage extends StatelessWidget {
  const _BackgrounImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        
        child: const FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}