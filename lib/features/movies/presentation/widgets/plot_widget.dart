import 'package:flutter/material.dart';

class PlotSection extends StatelessWidget {
  final String? plot;

  const PlotSection({super.key, required this.plot});

  @override
  Widget build(BuildContext context) {
    if (plot == null || plot!.isEmpty || plot == 'N/A') {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Plot',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          plot!,
          style: const TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
