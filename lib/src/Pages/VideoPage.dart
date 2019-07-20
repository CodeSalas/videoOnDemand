import 'package:appmovieuplabs/src/Models/PeliculaModel.dart';
import 'package:appmovieuplabs/src/Providers/PeliculasProvider.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class VideosYoutubePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PeliculasProvider pp = PeliculasProvider();
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: FutureBuilder(
        future: pp.getKeyVideo(pelicula.id.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return YoutubePlayer(
            context: context,
            source: snapshot.data,
            quality: YoutubeQuality.HD,
            startFullScreen: true,
          );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
