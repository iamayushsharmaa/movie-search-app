import 'package:flutter/material.dart';

class DetailPoster extends StatelessWidget {
  final String posterUrl;

  const DetailPoster({super.key, required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          posterUrl != 'N/A' ? posterUrl : 'https://via.placeholder.com/500',
          fit: BoxFit.cover,
        ),

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.white],
              stops: [0.6, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}
