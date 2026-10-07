import 'package:flutter/material.dart';

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
  //functions
  String textQuiChange = "Plouf";
  void _changeTextButton() {
    setState(() {
      textQuiChange = "qui qui reste";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("1640191 Examen"),
      ),
      body: Column(
        children: [
          // BACKGROUND AVEC SIZEDBOX
          // box rouge
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red
                  )
                ),
              ),
            ],
          ),

          //box bleu
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue
                  )
                ),
              ),
            ],
          ),

          //box vert
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.green
                  )
                ),
              ),
            ],
          ),

          // ligne noir
          SizedBox(
            width: double.infinity,
            height: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black
              )
            ),
          ),

          // BACKGROUND AVEC CONTAINER
          //box rouge
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 300,
                height: 50,
                color: Colors.red
              ),
            ],
          ),

          //box blue
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),

          //box vert
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.green
              ),
            ],
          ),

          //row boutons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: ((){}), 
                    child: Text("Plif")
                  ),
                ),
            
                Expanded(
                  child: MaterialButton(
                    onPressed: _changeTextButton, 
                    child: Text("Plaf")
                  ),
                ),
            
                Expanded(
                  child: MaterialButton(
                    onPressed: ((){}), 
                    child: Text(textQuiChange)
                  ),
                )
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Text(
                  "Quand on appuie sur le bouton Plaf, le text du bouton Plouf devient \"qui qui reste\"",
                ),
              ),
            ],
          ),

          Spacer(),

          Row(
            children: [
              Text("Ce texte est centré dans l'espace blanc / vide.\n Le bouton Plaf est un bouton de type MaterialButton.\n l'espace au dessus dessous des boutons est le padding par\n défaut."),
            ],
          ),

          Spacer()
        ],
      ),
    );
  }
}
