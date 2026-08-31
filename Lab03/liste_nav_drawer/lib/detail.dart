import 'package:flutter/material.dart';
import 'package:liste_nav_drawer/main.dart';
import 'package:liste_nav_drawer/monDrawer.dart';

class DetailPage extends StatelessWidget {
  // Variable qui contenir le texte passé
  final Truc monTruc;

  // prendre le texte en paramètre
  const DetailPage({super.key, required this.monTruc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails : ')),
      drawer: MonDrawer(),
      body: Center(
        child: Column(
          children: [
            Text('Nom : ${monTruc.nom}'),
            Text('ID : ${monTruc.id}'),
          ]
        ),
      ),
    );
  }


}
