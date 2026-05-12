import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/env.dart';
import 'package:myapp/models/movie_model.dart';

class MovieService {
  Future<MovieModel?> getMovieDetails() async {
    try {
      final response = await http.get(
        Uri.parse('${Env.url}/movie/11?language=pt-BR'),
        headers: {'Authorization': 'Bearer ${Env.apiKey}'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> mapBody = jsonDecode(response.body);

        return MovieModel.fromJson(mapBody);
      } else {
        return null;
      }
    } on Exception catch (e) {
      return null;
    }
  }

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await http.get(
        Uri.parse('${Env.url}/movie/popular?language=pt-BR'),
        headers: {'Authorization': 'Bearer ${Env.apiKey}'},
      );

      if(response.statusCode == 200){
        final Map<String, dynamic> mapBody = jsonDecode(response.body);
        final List<Map<String, dynamic>> listaResult = mapBody['results'];

        return listaResult.map((map) => MovieModel.fromJson(map)).toList();
      }
    } catch (e) {
      throw Exception();
    }
    return [];
  }
}
