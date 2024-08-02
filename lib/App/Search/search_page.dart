import 'package:flutter/material.dart';
import 'package:movieapp/App/Home/Widgets/movies_card_widget.dart';
import 'package:movieapp/Router/router.dart';
import 'package:movieapp/Shared/Models/discover_movies_model.dart';
import 'package:movieapp/Shared/Providers/movies_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const routeName = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Consumer(builder: (context, MoviesProvider moviesProvider, child) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  router.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              title: TextField(
                controller: searchController,
                onEditingComplete: () async {
                  if (searchController.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();

                    await moviesProvider
                        .fetchSearchMovies(searchController.text);
                  }
                },
                textInputAction: TextInputAction.search,
                decoration: searchDecoration(context),
              ),
            ),
            body: moviesProvider.getSearchMovies?.movies != null &&
                    moviesProvider.getSearchMovies?.movies?.isNotEmpty == true
                ? ListView.separated(
                    itemCount:
                        moviesProvider.getSearchMovies?.movies?.length ?? 0,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 64, left: 16, right: 16),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final movie =
                          moviesProvider.getSearchMovies?.movies?[index];
                      return MoviesCardWidget(
                        movie: movie ?? MovieModel(),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Nothing to show",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ));
      }),
    );
  }

  InputDecoration searchDecoration(BuildContext context) {
    return InputDecoration(
      hintText: 'Search',
      hintStyle: Theme.of(context).textTheme.bodyMedium,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black87,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
