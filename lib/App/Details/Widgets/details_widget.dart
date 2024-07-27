import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Center(
          child: Text(
            "The Dark Knight",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Action, Crime, Thriller",
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
              DateFormat('MMM, yyyy').format(DateTime.now()),
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
              "2h 32min",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
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
              child: const Text(
                "HD",
                style: TextStyle(
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
                    (Random().nextDouble() * 9.0).toStringAsFixed(1),
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
        const Text(
          "When Batman, Gordon and Harvey Dent successfully confront the corrupt mayor of an American city, they must train a group of deceptively trained criminals to compete in the city's underworld.When Batman, Gordon and Harvey Dent successfully confront the corrupt mayor of an American city, they must train a group of deceptively trained criminals to compete in the city's underworld.When Batman, Gordon and Harvey Dent successfully confront the corrupt mayor of an American city, they must train a group of deceptively trained criminals to compete in the city's underworld.When Batman, Gordon and Harvey Dent successfully confront the corrupt mayor of an American city, they must train a group of deceptively trained ",
        ),
        const SizedBox(height: 32),
        Text(
          "Cast",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
        ),
        const SizedBox(height: 8),
        const Text("Will Smith, Margot Robbie, ..."),
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
          NumberFormat.currency(symbol: "\$", decimalDigits: 0).format(100000000),
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
          NumberFormat.currency(symbol: "\$", decimalDigits: 0).format(100000000),
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
         Text("English",
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
         Text("Warner Bros. Pictures",
        style: Theme.of(context).textTheme.bodyMedium,
         ),
        
      ],
    );
  }
}
