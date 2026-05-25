import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/env.dart';
import 'package:myapp/models/movie_details_model.dart';
import 'package:myapp/models/movie_model.dart';

class MovieService {
  Future<MovieDetailsModel?> getMovieDetails(int id) async {
    try {
      final response = await http.get(
        Uri.parse('${Env.url}/movie/$id?language=pt-BR'),
        headers: {'Authorization': 'Bearer ${Env.apiKey}'},
      );
      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await http.get(
        Uri.parse('${Env.url}/movie/popular?language=pt-BR'),
        headers: {'Authorization': 'Bearer ${Env.apiKey}'},
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> mapBody = jsonDecode(response.body);
        final List<dynamic> listaResult = mapBody['results'];
        return listaResult.map((map) => MovieModel.fromJson(map)).toList();
      }
    } catch (e) {
      throw Exception();
    }
    return [];
  }
}
