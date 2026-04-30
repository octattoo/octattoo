import 'package:flutter/material.dart';

class ProfileEntry {
  final String id;
  final String name;
  final String handle;
  final int? seedColor;

  const ProfileEntry({
    required this.id,
    required this.name,
    required this.handle,
    this.seedColor,
  });
}

class ProfileSwitcher extends StatelessWidget {
  final List<ProfileEntry> profiles;
  final String activeProfileId;
  final void Function(String profileId) onSwitch;

  const ProfileSwitcher({
    super.key,
    required this.profiles,
    required this.activeProfileId,
    required this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    final active = profiles.firstWhere((p) => p.id == activeProfileId);

    return PopupMenuButton<String>(
      onSelected: onSwitch,
      itemBuilder: (context) => profiles
          .map((p) => PopupMenuItem(value: p.id, child: Text(p.name)))
          .toList(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(child: Text(active.name)),
      ),
    );
  }
}
