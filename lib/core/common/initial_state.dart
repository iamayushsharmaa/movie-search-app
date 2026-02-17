import 'package:flutter/material.dart';

class SearchInitialWidget extends StatelessWidget {
  const SearchInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Start searching for your favorite movies',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
