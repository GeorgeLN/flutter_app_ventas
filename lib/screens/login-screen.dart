// ignore_for_file: file_names, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:seguridad_clientes_app/providers/login_form_provider.dart';
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
                    
                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      
                      child: const _LoginForm(),
                    ),
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

    final loginForm = Provider.of<LoginFormProvider>(context); //Variable que tiene acceso a toda la clase "LoginFormProvider".

    return Form(
      //TODO: Mantener la referencia al "Key".
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction, //Valida en tiempo de ejecución lo ingresado en los TextFormField
 
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

            onChanged: (value) => loginForm.email = value, //Se asigna el valor del e-mail a la variable "email" de la clase LoginFormProvider.

            validator: (value) {

              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp( pattern  );

              return regExp.hasMatch(value ?? '')
                ? null
                : 'Formato de correo no valido';
            },
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

            onChanged: (value) => loginForm.password = value, //Se asigna el valor de la contraseña a la variable "password" de la clase LoginFormProvider.

            validator: (value) {
              
              if ( value != null && value.length >= 6) {
                return null;
              }
              else {
                return 'La contraseña debe ser de 6 carácteres';
              }
            },
          ),

          const SizedBox(height: 30),

          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            color: Colors.grey,
            elevation: 1,

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),

              child: Text(
                loginForm.isLoading
                  ? 'ESPERE ...'
                  : 'INGRESAR',
                style: const TextStyle(color: Colors.black54),
              ),
            ),

            onPressed: loginForm.isLoading ? null : () async {
              //TODO: AQUÍ VAN LAS VALIDACIONES EN BASE DE DATOS O PETICIONES HTTP.

              FocusScope.of(context).unfocus(); //Quita el teclado cuando se presiona el botón.

              if (loginForm.isValidForm() == true) {
                //Navigator.pushReplacementNamed(context, 'home'); //Ingresa al "HomeScreen" y se cierra el "LoginScreen".
              }
              else {
                return;
              }
              
              loginForm.isLoading = true;

              await Future.delayed(const Duration(seconds: 3));

              //TODO: Validar si el login es correcto "Back-end"
              loginForm.isLoading = false;

              Navigator.pushReplacementNamed(context, 'home'); //Ingresa al "HomeScreen".
            },
          ),
        ],
      ),
    );
  }
}