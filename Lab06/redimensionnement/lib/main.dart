import 'package:flutter/material.dart';
import 'package:liste_nav_drawer/basse_reso.dart';
import 'package:liste_nav_drawer/haute_reso.dart';
import 'package:liste_nav_drawer/reso_ajuste.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BasseResoPage(),
                ),
              );
            }, 
            child: Text("Basse résolution")
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => HauteResoPage(),
                ),
              );
            }, 
            child: Text("Haute résolution")
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ResoAjustePage(),
                ),
              );
            }, 
            child: Text("Résolution ajusté")
          ),
        ]
      )
    );
  }
}