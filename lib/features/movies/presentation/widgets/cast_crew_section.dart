import 'package:flutter/material.dart';
import 'package:moviesearch/features/movies/presentation/ui_model/crew_member.dart';
import 'package:moviesearch/features/movies/presentation/widgets/crew_member_tile_widget.dart';

class CastCrewSection extends StatelessWidget {
  final String? actors;
  final String? director;

  const CastCrewSection({
    super.key,
    required this.actors,
    required this.director,
  });

  @override
  Widget build(BuildContext context) {
    final List<CrewMember> members = [];

    if (director != null && director!.isNotEmpty && director != 'N/A') {
      members.add(CrewMember(name: director!, role: 'Director'));
    }

    if (actors != null && actors!.isNotEmpty && actors != 'N/A') {
      final actorList = actors!.split(',');

      for (final actor in actorList) {
        members.add(CrewMember(name: actor.trim(), role: 'Actor'));
      }
    }

    if (members.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cast & Crew',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Column(
          children: members
              .map((member) => CrewMemberTile(member: member))
              .toList(),
        ),
      ],
    );
  }
}
