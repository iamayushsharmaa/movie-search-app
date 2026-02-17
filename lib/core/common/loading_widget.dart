
import 'package:flutter/material.dart';

class SearchLoadingWidget extends StatelessWidget {
  const SearchLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.lightBlue),
          SizedBox(height: 16),
          Text(
            'Searching movies...',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
