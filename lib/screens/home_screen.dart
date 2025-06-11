import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widgets/custom_swipper.dart';
import 'package:movie_app/widgets/custom_listview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final providerOfMovies = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(' Movie App'),backgroundColor: const Color.fromARGB(255, 52, 130, 240)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSwipper(movies: providerOfMovies.nowPlayingMovies),
            SizedBox(height: 30),
            CustomListView(movies: providerOfMovies.nowPlayingMovies),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
