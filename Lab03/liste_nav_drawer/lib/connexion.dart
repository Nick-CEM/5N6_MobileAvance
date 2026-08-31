import 'package:flutter/material.dart';
import 'package:liste_nav_drawer/monDrawer.dart';

class Connexion extends StatelessWidget {
  const Connexion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      drawer: MonDrawer(),
      body: const Center(
        child: Text('Une page de connexion quelconque'),
      ),
    );
  }
}