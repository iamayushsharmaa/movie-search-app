import 'package:flutter/material.dart';
import 'package:moviesearch/features/movies/presentation/ui_model/crew_member.dart';

class CrewMemberTile extends StatelessWidget {
  final CrewMember member;

  const CrewMemberTile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final firstLetter = member.name.isNotEmpty
        ? member.name[0].toUpperCase()
        : '?';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              firstLetter,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                member.role,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
