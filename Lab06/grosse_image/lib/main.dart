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

  String _imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          
          // Texte field pour l'URL
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'URL de l\'image',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // TODO #3a : On tente de charger l'image depuis l'URL saisie par l'utilisateur à chaque fois que le contenu du TextField change.
              // Utilisez cette image pour tester, qui est longue à charger : https://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg
              setState(() {
                _imageUrl = value;
              });
            },
          ),

          // Liste des images dans un ListView
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.blue,
                    title: Column(
                      children: [
                        Builder(
                          builder: (context) {
                            if (_imageUrl.isEmpty) {
                              return const Text(
                                'Aucune image sélectionnée',
                                style: TextStyle(fontSize: 16),
                              );
                            } else {
                              return Image.network(
                                // Uncomment next line pour cancel la cache
                                _imageUrl /*+ "?" + index.toString()*/,
                                // TODO #3c : Charger une image peut prendre du temps. On veut toujours indiquer à l'utilisateur qu'il se passe quelque chose.
                                loadingBuilder:
                                    (
                                      BuildContext context,
                                      Widget imageChargee,
                                      ImageChunkEvent? loadingProgress,
                                    ) {
                                      // TODO #3d: Si loadingProgress est null, le téléchargement est terminé.
                                      // On retourne alors l'enfant (l'image finale).
                                      if (loadingProgress == null) {
                                        return imageChargee;
                                      }
            
                                      // TODO #3e: On recoit l'image par morceaux. Calcul de la progression du chargement(de 0.0 à 1.0) de l'image.
                                      final double? progress =
                                          loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                          : null; // null si le serveur ne fournit pas l'en-tête Content-Length
            
                                      // TODO #3f: On retourne un indicateur de progression circulaire avec la valeur de progression calculée.
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: progress,
                                          strokeWidth: 4.0,
                                        ),
                                      );
                                    },
                                // TODO #3b: On a moins de contrôle sur la source de l'image que pour les autres options.
                                // C'est donc toujours important de gérer les erreurs, même lorsque ce n'est pas l'utilisateur qui a le contrôle de l'URL.
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text(
                                    'Erreur lors du chargement de l\'image',
                                    style: TextStyle(fontSize: 16, color: Colors.red),
                                  );
                                },
                                width: 220,
                                height: 220,
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        ),
                      ]
                    ),
                  )
                );
              }
            ),
          ),
        ],
      )
    );
  }
}
