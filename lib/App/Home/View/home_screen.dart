import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Shared/Providers/movies_provider.dart';
import '../Widgets/movies_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Completer _completer = Completer();
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    final moviesProvider = context.read<MoviesProvider>();

    await Future.wait([

      moviesProvider.fetchMovies(),

      moviesProvider.fetchGenres(),

    ]).then((value)=> _completer.complete());
  }
  

  @override
  Widget build(BuildContext context) {
    final moviesProvider = context.watch<MoviesProvider>();
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Text(
            "Trending Movies",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () async {
                // final moviesProvider = context.read<MoviesProvider>();
                // await moviesProvider.fetchMovies();
              },
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.black,
                size: 32,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ],
        ),
        body: FutureBuilder(
          future: _completer.future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
              itemCount: moviesProvider.getMovies.movies?.length??0,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final movie = moviesProvider.getMovies.movies![index];
                return  MoviesCardWidget(
                  movie:movie,
                );
              },
            );
          }
        ));
  }
}
