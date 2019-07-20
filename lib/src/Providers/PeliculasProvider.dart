import 'dart:async';
import 'dart:convert';

import 'package:appmovieuplabs/src/Models/PeliculaModel.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = "8820a8f9ca35737c347aea0e029a51f7";
  String _url = "api.themoviedb.org";
  String _language = "es-Es";
  int _popularesPage = 0;

  List<Pelicula> _populares = new List();
  bool _cargando = false;

  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void dispose() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEncines() async {
    final url = Uri.https(_url, "3/movie/now_playing",
        {'api_key': _apikey, 'language': _language});
    return await this._procesarRespuesta(url);
  }

  Future<String> getKeyVideo(String idPelicula) async {
    final url = Uri.https(_url, "3/movie/$idPelicula/videos", {'api_key': _apikey, 'language': _language});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final results = decodedData['results'];
    final id = results[0]['key'];
    return id;
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) {
      return [];
    } else {
      _cargando = true;
      _popularesPage++;
      final url = Uri.https(_url, "3/movie/popular", {
        'api_key': _apikey,
        'language': _language,
        'page': _popularesPage.toString()
      });
      final resp = await _procesarRespuesta(url);
      _populares.addAll(resp);
      popularesSink(_populares);
      _cargando = false;
      return resp;
    }
  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    _popularesPage++;
    final url = Uri.https(_url, "3/search/movie",
        {'api_key': _apikey, 'language': _language, 'query': query});

    return await _procesarRespuesta(url);
  }
}
