import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/App/Details/View/detail_screen.dart';
import 'package:movieapp/App/Home/Widgets/image_widget.dart';
import 'package:movieapp/Router/router.dart';
import 'package:movieapp/Shared/Models/discover_movies_model.dart';
import 'package:movieapp/Shared/Providers/movies_provider.dart';
import 'package:movieapp/Utility/api.dart';
import 'package:provider/provider.dart';

import '../../../Utility/helpers.dart';

class MoviesCardWidget extends StatelessWidget {
  const MoviesCardWidget({
    super.key,
    required this.movie,
  });
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final genres = getGenresById(
        context.read<MoviesProvider>().getGenres, movie.genreIds ?? []);
    return InkWell(
      onTap: () {
        router.push(DetailsScreen.routeName, extra: movie.id);
      },
      child: Row(
        spacing: 16,
        children: [
          ImageWidget(
            imageUrl: "$imageBaseUrl${movie.posterPath}",
            width: scrennWidth(context) * 0.3,
            height: scrennWidth(context) * 0.45,
            borderRadius: 10,
          ),
          // const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "${movie.title}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  children: [
                    Text(
                      "${movie.releaseDate?.year}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  genres.map((e) => e.name).join(", "),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Popularity: ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                      TextSpan(
                        text: NumberFormat.decimalPattern("en_us")
                            .format(movie.popularity?.round()),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        NumberFormat.compact().format(movie.voteCount),
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.black87,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${movie.voteAverage?.toStringAsFixed(1)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.black87,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
