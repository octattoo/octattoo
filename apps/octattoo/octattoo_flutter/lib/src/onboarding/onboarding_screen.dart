import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../profile/profile_switcher.dart';
import 'onboarding_wizard.dart';

/// Full-screen onboarding route that creates the first Artist Profile.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWizard(
      onComplete: (result) async {
        try {
          final profile = await client.artistProfile.createProfile(
            result.name,
            result.handle,
          );
          profileState.setProfiles([
            ProfileEntry(
              id: profile.id.toString(),
              name: profile.name,
              handle: profile.handle,
            ),
          ]);
          if (context.mounted) context.go('/appointments');
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to create profile: $e')),
            );
          }
        }
      },
    );
  }
}
