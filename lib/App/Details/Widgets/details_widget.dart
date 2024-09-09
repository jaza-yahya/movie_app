
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/Shared/Models/movie_details_model.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.movie,
  });
  final MovieDetailsModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Center(
          child: Text(
           movie.title??'',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width:double.maxFinite,
          child: Wrap(
            
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                movie.genres?.map((e) => e.name).join(", ") ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 12,
                child: VerticalDivider(
                  color: Colors.grey,
                  width: 32,
                  thickness: 2,
                ),
              ),
              Text(
                DateFormat('MMM, yyyy').format(movie.releaseDate ?? DateTime.now()),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // const SizedBox(
              //   height: 12,
              //   child: VerticalDivider(
              //     color: Colors.grey,
              //     width: 32,
              //     thickness: 2,
              //   ),
              // ),
              // Text(
              //   "2h 32min",
              //   style: Theme.of(context).textTheme.bodyMedium,
              // ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(4),
              ),
              child:  Text(
                NumberFormat.compact().format(movie.voteCount),
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black87,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          "Overview",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
        ),
        const SizedBox(height: 8),
         Text(
          movie.overview ?? "",
        ),
        const SizedBox(height: 32),
        Text(
          "Tagline",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
        ),
        const SizedBox(height: 8),
         Text(movie.tagline ?? "",
          style: Theme.of(context).textTheme.bodyMedium,
          ),
         const SizedBox(height: 16),
        Text(
          "Budget",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
        ),
        const SizedBox(height: 8),
         Text(
          NumberFormat.currency(symbol: "\$", decimalDigits: 0).format(movie.budget ?? 0),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          "Revenue",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
        ),
        const SizedBox(height: 8),
         Text(
          NumberFormat.currency(symbol: "\$", decimalDigits: 0).format(movie.revenue ?? 0),
          style: Theme.of(context).textTheme.bodyMedium,
         ),
        const SizedBox(height: 16),
        Text(
          "Spoken Languages",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
        ),
        const SizedBox(height: 8),
         Text(
          movie.spokenLanguages?.map((e) => e.name).join(", ") ?? "",
        style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          "Production Companies",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
        ),
        const SizedBox(height: 8),
         Text(
          movie.productionCompanies?.map((e) => e.name).join(", ") ?? "",
        style: Theme.of(context).textTheme.bodyMedium,
         ),
        
      ],
    );
  }
}
