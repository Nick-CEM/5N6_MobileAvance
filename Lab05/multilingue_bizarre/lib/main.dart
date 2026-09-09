import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

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
      // i18n
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
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

  // mettre nomsChatLambda au lieu de noms plus bas
  //List<String> get nomsChatLambda => [S.of(context).chatA, S.of(context).chatB, S.of(context).chatC, S.of(context).chatD];

  List<String> nomsChat() {
    return [S.of(context).chatA, S.of(context).chatB, S.of(context).chatC, S.of(context).chatD];
  }

  @override
  Widget build(BuildContext context) {

    // pas besoin si utilise la lambda
    List<String>  noms = nomsChat();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemCount: noms.length,
          itemBuilder: (context, index){
            return Card(
              child: Center(
                child: Column(
                  children: [
                    Text(noms[index]),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset("assets/images/chat${index + 1}.jpg"),
                    ))
                  ],
              ))
            );
          },
        ),
      ),
    );
  }
}
