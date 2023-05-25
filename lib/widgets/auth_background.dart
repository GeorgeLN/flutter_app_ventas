// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
   
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      width: double.infinity,
      height: double.infinity,

      child: Stack(
        children: [
          //Fondo negro dividido.
          const _BlackBox(),

          //Ícono central
          const _HeaderIcon(),

          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea( //Separación en el borde superior del dispositivo.
      child: Container(
        width: double.infinity,
        //color: Colors.red,
        margin: const EdgeInsets.only(top: 45),
    
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
        
      ),
    );
  }
}

class _BlackBox extends StatelessWidget {
  
  const _BlackBox({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: ( size.height * 0.4 ),
      
      decoration: _buildBoxDecoration(),

      child: const Stack(
        children: [
          Positioned(child: _Bubble(), top: 105, left: 50),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: 0, right: 0),
          Positioned(child: _Bubble(), bottom: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 30, right: 20),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(52, 73, 94 , 1),
        Color.fromRGBO(23, 32, 42, 1),
        //Color.fromRGBO(63, 63, 156, 1),
        //Color.fromRGBO(90, 70, 178, 1),
      ]
    )
  );
}

class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}