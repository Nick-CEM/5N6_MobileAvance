import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Connexion à l'émulateur Firestore local (à lancer avec
  // `firebase emulators:start --only firestore`).
  // 10.0.2.2 correspond à la machine hôte depuis un émulateur Android.
  FirebaseFirestore.instance.useFirestoreEmulator('10.0.2.2', 8080);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intra pratique',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _texteController = TextEditingController();

  void _ajouter() {
    // Ajoute un objet avec ID auto-généré dans la collection `trash`
    // avec l'heure du clic. Sert de démo, à remplacer par le vrai
    // traitement demandé dans l'énoncé.
    FirebaseFirestore.instance.collection('messages').add({
      //'heure': DateTime.now().toIso8601String(),
      'message' : _texteController.text,
      'auteur': "Martel, Nicolas"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Intra pratique'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _texteController,
                decoration: const InputDecoration(labelText: 'Texte'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    onPressed: _ajouter,
                    child: const Text('Ajouter'),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Supprimer'),
                  ),
                  Spacer(),
                ],
              ),
              //const SizedBox(height: 16),
              //const Expanded(child: SizedBox()),
        
              // Grid données de la bd en flux
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("messages").snapshots(),
                builder: (context, snapshot) {
                  // Erreur
                  if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  }
                  // Loading
                  if (!snapshot.hasData) {
                    return Text('Chargement...');
                  }
                  // Result
                  final messages = snapshot.data!.docs;
                  return 
                  ListView.builder( // REMPLACER PAR gridView.builder ET DÉCOMMENTER gridDelegate POUR METTRE EN GRILLE
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    /*gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 5,
                        ),*/
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                messages[index]["message"],
                              ),
                              Text(
                                messages[index]["auteur"],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
