import 'dart:math';

import 'package:flutter/foundation.dart';
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

  List<String> prenoms = [
    'Alice',
    'Thomas',
    'Sophie',
    'Lucas',
    'Emma'
  ];

  List<String> prenomsOrdre = [
    'Alice',
    'Thomas',
    'Emma',
    'Lucas',
    'Sophie'
  ];

  bool afficherVictoire = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: prenoms.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(prenoms[index])
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if(index > 0){
                              final temp = prenoms[index];
                              prenoms[index] = prenoms[index - 1];
                              prenoms[index - 1] = temp;
                            }

                            if(listEquals(prenoms, prenomsOrdre)){
                              afficherVictoire = true;
                            }
                          });

                          Future.delayed(const Duration(seconds: 2)).then((_) {
                            setState(() {
                              if(listEquals(prenoms, prenomsOrdre)){
                                afficherVictoire = false;
                                prenoms.shuffle(Random());
                              }
                            });
                          });
                        }, 
                        child: Text("Monter")
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if(index < prenoms.length - 1){
                              final temp = prenoms[index];
                              prenoms[index] = prenoms[index + 1];
                              prenoms[index + 1] = temp;
                            }

                            if(listEquals(prenoms, prenomsOrdre)){
                              afficherVictoire = true;
                            }
                          });

                          Future.delayed(const Duration(seconds: 2)).then((_) {
                            setState(() {
                              if(listEquals(prenoms, prenomsOrdre)){
                                afficherVictoire = false;
                                prenoms.shuffle(Random());
                              }
                            });
                          });
                        }, 
                        child: Text("Descendre")
                      ),
                    ]
                  );
                },
              )
            ),
            if(afficherVictoire)
              Text("Victoire"),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  prenoms.shuffle(Random());
                });
              }, 
              child: Text("Shuffle")
            )
          ],
        )
      ),
    );
  }
}
