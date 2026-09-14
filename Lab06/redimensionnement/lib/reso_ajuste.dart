import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ResoAjustePage extends StatelessWidget {

  // prendre le texte en paramètre
  const ResoAjustePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Résolution ajusté')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    var largeur = constraints.maxWidth.floor().toString();
                    return CachedNetworkImage(
                        imageUrl: "https://picsum.photos/$largeur",
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  },
                ),
              ]
            ),
          );
        },
      ),
    );
  }
}
