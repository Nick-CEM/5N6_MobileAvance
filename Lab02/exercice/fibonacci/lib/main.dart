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
  // functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 21,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.red))
              ],
            )
          ),
          Expanded(
            flex: 13,
            child: Row(
              children: [
                Expanded(flex: 13, child: Container(color: Colors.green,)),
                Expanded(
                  flex: 8, 
                  child: Column(
                    children: [
                      Expanded(flex: 5, child: Row(
                          children: [
                            Expanded(flex: 3, child: Column(children: [Expanded(child: Container(color: Colors.blue))],)),
                            Expanded(flex: 5, child: Column(children: [Expanded(child: Container(color: Colors.purple))],))
                          ],
                        )
                      ),
                      Expanded(flex: 8, child: Row(children: [Expanded(child: Container(color: Colors.yellow))],)),
                    ],
                  )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
