import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AggGif {
  
  AggGif(this.gifPath);

  final String gifPath;

  Future<Widget> getGifWidget() async {
    
    final storage = FirebaseStorage.instance;

   
    final gifRef = storage.ref().child(gifPath);

    try {
      final gifUrl = await gifRef.getDownloadURL();

      return CachedNetworkImage(
        imageUrl: gifUrl,
        errorWidget: (context, url, error) => noInternet(error),
        fit: BoxFit.cover,
      );
    } catch (error) 
    {
      return Center(child: Text('Error al cargar el GIF: $error'));
    }
  }
}

Widget noInternet(Object error) {
        if (error is Exception) {
            return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(Icons.videocam_off, color: Colors.red, size: 48),
                ],
            );
        } else 
        {
            return Center(child: Text('Error al cargar el GIF: $error'));
        }
    }
