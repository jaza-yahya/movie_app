import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/App/Home/Widgets/image_Widget.dart';
import 'package:movieapp/Router/router.dart';
import 'package:movieapp/Utility/api.dart';
import 'package:movieapp/Utility/helpers.dart';
import 'package:provider/provider.dart';

import '../../../Shared/Providers/movies_provider.dart';
import '../Widgets/bottom_buttons_widget.dart';
import '../Widgets/details_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.movieId,
  });
  final int movieId;
  static const routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Completer _completer = Completer();

  @override
  void initState() {
    super.initState();
    getMovieDetails();
  }
  void getMovieDetails()async{
    final moviesProvider = context.read<MoviesProvider>();
   await moviesProvider.fetchMovieDetails(widget.movieId);
    _completer.complete();
  }
  @override
  Widget build(BuildContext context) {
    final moviesProvider = context.read<MoviesProvider>();
    
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
        ),
      ),
      child: Scaffold(
        body: FutureBuilder(
          future: _completer.future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
              
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {
                      router.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  pinned: true,
                  backgroundColor: Colors.white,
                  expandedHeight: scrennWidth(context),
                  flexibleSpace: FlexibleSpaceBar(
                    background: ImageWidget(
                   imageUrl:"$imageBaseUrl${moviesProvider.getMovieDetails.posterPath}"
                      ,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            DetailsWidget(
                              movie: moviesProvider.getMovieDetails,
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        ),
        persistentFooterButtons: const [
          BottomButtonsWidget(),
        ],
      ),
    );
  }
}
