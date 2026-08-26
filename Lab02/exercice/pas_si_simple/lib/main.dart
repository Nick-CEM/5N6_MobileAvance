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
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Pas si simple'),
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
  // functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 200,
                    color: Colors.red
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("YO", style: TextStyle(color: Colors.red),)
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.white
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Bouton du bas", style: TextStyle(color: Colors.white))
                )
              ),
            )
          ],
        )
      )
    );
  }
}
