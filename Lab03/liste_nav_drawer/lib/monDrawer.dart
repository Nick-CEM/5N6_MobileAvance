import 'package:flutter/material.dart';
import 'package:liste_nav_drawer/main.dart';
import 'package:liste_nav_drawer/connexion.dart';

class MonDrawer extends StatelessWidget {
  const MonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Nicolas Martel'),
          ),

          ListTile(
            title: const Text('Accueil 🏠'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Liste(title: 'Flutter Demo Home Page'),
                ),
              );
            },
          ),

          ListTile(
            title: const Text('Déconnexion 🙋'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => const Connexion(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
