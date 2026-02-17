import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String? value;

  const RatingItem({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isValid = value != null && value!.isNotEmpty && value != 'N/A';

    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
        ),
        const SizedBox(height: 8),

        if (isValid)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 18),
              const SizedBox(width: 6),
              _FormattedRatingText(value!),
            ],
          )
        else
          Text(
            'N/A',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          ),
      ],
    );
  }
}

class _FormattedRatingText extends StatelessWidget {
  final String value;

  const _FormattedRatingText(this.value);

  @override
  Widget build(BuildContext context) {
    if (!value.contains('/')) {
      // Example: 91%
      return Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      );
    }

    final parts = value.split('/');

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: parts[0],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: '/${parts[1]}',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
