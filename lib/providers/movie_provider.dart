import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movie_app/models/models.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> popularMovies = [];
  List<Movie> nowPlayingMovies = [];

  final urlm = 'api.themoviedb.org';
  final segmento = '/3/movie/popular';
  final segNew = '/3/movie/now_playing';
  final apikey = '1d0e6e1e3eaa2ea344d894e438f72919';
  
  MovieProvider() {
    getMoviesByPopular();
    getMoviesNowPlaying();
  }

  Future<String> getPopularMovies({String? seg}) async {
    final url = Uri.https(urlm, segmento, {'api_key': apikey});
    var response = await http.get(url);
    return response.body;
  }
  Future<String> getNewPlayingMovies({String? seg}) async {
    final url = Uri.https(urlm, segNew, {'api_key': apikey});
    var response = await http.get(url);
    return response.body;
  }

  void getMoviesByPopular() async {
    final resp = await getPopularMovies();
    final data = convert.jsonDecode(resp) as Map<String, dynamic>;
    final popularResponse = MovieResponse.fromJson(data);
    popularMovies = popularResponse.results;
    notifyListeners();
  }
  void getMoviesNowPlaying() async {
    final resp = await getNewPlayingMovies();
    final data = convert.jsonDecode(resp) as Map<String, dynamic>;
    final nowPlayingResponse = MovieResponse.fromJson(data);
    nowPlayingMovies = nowPlayingResponse.results; 
    notifyListeners();
  }
}
