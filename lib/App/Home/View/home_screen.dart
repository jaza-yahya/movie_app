import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/App/Home/Widgets/paginator_widget.dart';
import 'package:movieapp/App/Search/search_page.dart';
import 'package:movieapp/Router/router.dart';
import 'package:movieapp/Shared/Models/discover_movies_model.dart';
import 'package:movieapp/Shared/Preferences/preferences.dart';
import 'package:movieapp/Shared/Providers/network_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../Shared/Providers/movies_provider.dart';
import '../Widgets/movies_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer _completer = Completer();
  final DataPagerController _dataPagerController = DataPagerController();
  int? totalPages;
  @override
  void initState() {
    super.initState();
    NetworkProvider.to.listenToInternet();

    fetchData();
  }

  void fetchData() async {
    final moviesProvider = context.read<MoviesProvider>();

    final hasInternet = await NetworkProvider.to.checkInternetConnection();
    if (hasInternet) {
      await Future.wait([
        moviesProvider.fetchMovies(page: 1),
        moviesProvider.fetchGenres(),
      ]).then((value) {
        totalPages = moviesProvider.getMovies?.totalPages;
        _completer.complete();
        MoviesPreferences.to.saveTotalPages(totalPages ?? 0);
      });
    } else {
      totalPages = await MoviesPreferences.to.getTotalPages();
      final movies = await MoviesPreferences.to.getMovies(1);
      moviesProvider.setMovies(movies);
      _completer.complete();
    }
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
              router.push(SearchPage.routeName);
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
            return Stack(
              children: [
                if (moviesProvider.getMovies?.movies != null &&
                    moviesProvider.getMovies?.movies?.isNotEmpty == true)
                  ListView.separated(
                    itemCount: moviesProvider.getMovies?.movies?.length ?? 0,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 64, left: 16, right: 16),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final movie = moviesProvider.getMovies?.movies![index];
                      return MoviesCardWidget(
                        movie: movie ?? MovieModel(),
                      );
                    },
                  )
                else
                  Center(
                    child: Text(
                      "No movies found",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black87),
                    ),
                  ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: PaginatorWidget(
                    dataPagerController: _dataPagerController,
                    moviesProvider: moviesProvider,
                    totalPages: totalPages ?? 0,
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    _dataPagerController.dispose();
    super.dispose();
  }
}
