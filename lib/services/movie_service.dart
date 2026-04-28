import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/env.dart';
import 'package:myapp/models/movie_model.dart';

class MovieService {
  Future<MovieModel?> getMovieDetails() async {
    try {
      final response = await http.get(
        Uri.parse('$url/movie/11?language=pt-BR'),
        headers: {'Authorization': 'Bearer $apiKey'},
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

  Future<List<MovieModel>> getTopRatedMovie() async {
    try {
      final response = await http.get(
        Uri.parse('$url/movie/top_rated?language=pt-BR'),
        headers: {'Authorization': 'Bearer $apiKey'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> mapBody = jsonDecode(response.body);

        final List<Map<String, dynamic>> data = mapBody['results'];

        return data.map((json) => MovieModel.fromJson(json)).toList();
      }
    } catch (e) {
      return [];
    }
    return [];
  }
}
