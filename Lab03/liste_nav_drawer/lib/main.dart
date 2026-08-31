import 'package:flutter/material.dart';
import 'package:liste_nav_drawer/connexion.dart';
import 'package:liste_nav_drawer/detail.dart';
import 'package:liste_nav_drawer/monDrawer.dart';

void main() {
  runApp(const MyApp());
}

class Truc {
  final String nom;
  final int id;

  Truc({
    required this.nom,
    required this.id,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Liste(title: 'Flutter Demo Home Page'),
    );
  }
}

class Liste extends StatefulWidget {
  const Liste({super.key, required this.title});

  final String title;

  @override
  State<Liste> createState() => _Liste();
}

class _Liste extends State<Liste> {

  final List<Truc> trucs = [
    Truc(nom: 'Patate', id: 1),
    Truc(nom: 'Carotte', id: 2),
    Truc(nom: 'Tomate', id: 3),
    Truc(nom: 'Oignon', id: 4),
    Truc(nom: 'Poivron', id: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: MonDrawer(),
      body: ListView.builder(
        itemCount: trucs.length,
        itemBuilder: (context, index) {
          final truc = trucs[index];

          return ListTile(
            title: Text(truc.nom),
            subtitle: Text('ID : ${truc.id}'),

            // Quand on clique sur le Truc
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailPage(
                    monTruc: truc,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
