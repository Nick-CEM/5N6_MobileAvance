import 'package:flutter/material.dart';
import 'package:simple_nav/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // controlleur pour mon texte
  final TextEditingController monTexteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              controller: monTexteController,
              decoration: InputDecoration(
                labelText: 'info à passer',
                hintText: 'patate',
                border: OutlineInputBorder(),
              )
            ),
            // Je push la page detail dans le stack avec comme paramètre mon texte
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => DetailPage(monTexte: monTexteController.text)));
              }, 
              child: Text('Passer l\'info!')
            )
          ]
        ),
      ),
    );
  }
}
