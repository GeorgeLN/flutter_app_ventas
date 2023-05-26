// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers
import 'package:flutter/material.dart';

//import 'package:seguridad_clientes_app/screens/screens.dart';

class SideMenu extends StatelessWidget {
   
  const SideMenu({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,

        children: [

          const _DrawerHeader(),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),

            onTap: () {
              //Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),

          ListTile(
            leading: const Icon(Icons.people_alt),
            title: const Text('People'),

            onTap: () {
              
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),

            onTap: () {
              //Navigator.pop(context); //Permite cerrar el "Drawer" al momento de abrir otro Screen.
              //Navigator.pushNamed(context, SettingsScreen.routerName); //Permite abrir otro Screen al seleccionar una opción en el Drawer.
              //Navigator.pushReplacementNamed(context, SettingsScreen.routerName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Container(
              //color: Colors.red,
              child: const CircleAvatar(
                maxRadius: 50,
                backgroundImage: NetworkImage('https://cdn.profoto.com/cdn/053149e/contentassets/d39349344d004f9b8963df1551f24bf4/profoto-albert-watson-steve-jobs-pinned-image-original.jpg?width=1280&quality=75&format=jpg'),
              ),
            ),

            const Text('USUARIO: \nNombre Usuario', style: TextStyle(color: Colors.white, fontSize: 20)),
          ], //Children
        ),
      ),

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}