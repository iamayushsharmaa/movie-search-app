import 'package:flutter/material.dart';
import 'package:moviesearch/features/movies/presentation/widgets/rating_items.dart';

class RatingsSection extends StatelessWidget {
  final String? imdb;
  final String? rottenTomatoes;
  final String? metacritic;

  const RatingsSection({
    super.key,
    required this.imdb,
    required this.rottenTomatoes,
    required this.metacritic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.grey.withOpacity(0.2), thickness: 1),

        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RatingItem(
                title: 'IMDb',
                icon: Icons.star,
                iconColor: Colors.amber,
                value: imdb != null ? '$imdb/10' : null,
              ),
            ),

            _VerticalFadeDivider(),

            Expanded(
              child: RatingItem(
                title: 'Rotten Tomatoes',
                icon: Icons.local_fire_department,
                iconColor: Colors.red,
                value: rottenTomatoes,
              ),
            ),

            _VerticalFadeDivider(),

            Expanded(
              child: RatingItem(
                title: 'Metacritic',
                icon: Icons.verified,
                iconColor: Colors.green,
                value: metacritic,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Divider(color: Colors.grey.withOpacity(0.2), thickness: 1),
      ],
    );
  }
}

class _VerticalFadeDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 1,
      color: Colors.grey.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
