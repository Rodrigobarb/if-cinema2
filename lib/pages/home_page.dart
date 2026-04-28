import 'package:flutter/material.dart';
import 'package:myapp/models/movie_model.dart';
import 'package:myapp/services/movie_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieModel? movie;

  @override
  void initState() {
    carregarView();
    super.initState();
  }

  void carregarView() async {
    movie = await MovieService().getMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Minha tela')),
      body: Center(child: Text('Nome do Filme ${movie?.title}')),
    );
  }
}
