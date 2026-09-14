import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BasseResoPage extends StatefulWidget {

  // prendre le texte en paramètre
  const BasseResoPage({super.key});

  @override
  State<BasseResoPage> createState() => _BasseResoPage();

}

class _BasseResoPage extends State<BasseResoPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basse résolution')),
      body: Center(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                return CachedNetworkImage(
                    imageUrl: "https://picsum.photos/200",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                );
              },
            ),
          ]
        ),
      ),
    );
  }
}
