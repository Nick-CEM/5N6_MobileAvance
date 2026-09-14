import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HauteResoPage extends StatelessWidget {

  // prendre le texte en paramètre
  const HauteResoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Haute résolution')),
      body: Center(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                return CachedNetworkImage(
                    imageUrl: "https://picsum.photos/5000",
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
