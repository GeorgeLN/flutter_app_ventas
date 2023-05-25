import 'package:flutter/material.dart';
import 'package:seguridad_clientes_app/ui/input_decortations.dart';
import 'package:seguridad_clientes_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView( //Permite hacer Scroll a los "hijos" en caso de que la pantalla ya no de.
          child: Column(
            children: [
              
              const SizedBox(height: 230),

              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Iniciar sesión', style: Theme.of(context).textTheme.headlineMedium),

                    const SizedBox(height: 30),
                    const _LoginForm(),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              const Text('Crear una nueva cuenta'),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      //TODO: Mantener la referencia al "Key"
      child: Column(
        children: [

          TextFormField(
            autocorrect: false, //Evita el autocorrector
            keyboardType: TextInputType.emailAddress,

            decoration: InputDecorations.authInputDecoration(
              hintText: 'Ejemplo@gmail.com',
              labelText: 'Correo electrónico',
              prefixIcon: Icons.alternate_email,
            ),
          ),

          const SizedBox(height: 30),

          TextFormField(
            autocorrect: false, //Evita el autocorrector
            obscureText: true,
            keyboardType: TextInputType.emailAddress,

            decoration: InputDecorations.authInputDecoration(
              hintText: 'Contraseña',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_open,
            ),
          ),

          const SizedBox(height: 30),

          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            color: Colors.grey,
            elevation: 1,

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: const Text('INGRESAR', style: TextStyle(color: Colors.black54)),
            ),

            onPressed: () {
              
            },
          ),
        ],
      ),
    );
  }
}