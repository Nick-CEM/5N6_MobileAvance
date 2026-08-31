import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // Variable qui contenir le texte passé
  final String monTexte;

  // prendre le texte en paramètre
  const DetailPage({super.key, required this.monTexte});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails : ')),
      body: Center(
        child: Column(
          children: [Text(monTexte)]
        ),
      ),
    );
  }


}
