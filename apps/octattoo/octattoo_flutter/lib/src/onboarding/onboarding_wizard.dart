import 'package:flutter/material.dart';

class OnboardingResult {
  final String name;
  final String handle;

  OnboardingResult({required this.name, required this.handle});
}

class OnboardingWizard extends StatefulWidget {
  final void Function(OnboardingResult result) onComplete;

  const OnboardingWizard({super.key, required this.onComplete});

  @override
  State<OnboardingWizard> createState() => _OnboardingWizardState();
}

class _OnboardingWizardState extends State<OnboardingWizard> {
  int _step = 0;
  final _nameController = TextEditingController();
  final _handleController = TextEditingController();

  String _slugify(String name) {
    var slug = name
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9_\s]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '_');
    slug = slug.replaceAll(RegExp(r'^[^a-z]+'), '');
    if (slug.length < 3) slug = '${slug}artist'.substring(0, 3);
    if (slug.length > 30) slug = slug.substring(0, 30);
    return slug;
  }

  void _next() {
    if (_step == 0) {
      if (_nameController.text.trim().isEmpty) return;
      _handleController.text = _slugify(_nameController.text);
      setState(() => _step = 1);
    }
  }

  void _finish() {
    widget.onComplete(OnboardingResult(
      name: _nameController.text,
      handle: _handleController.text,
    ));
  }

  void _back() {
    setState(() => _step = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: _step == 0 ? _buildNameStep() : _buildHandleStep(),
      ),
    );
  }

  Widget _buildNameStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Profile name'),
        TextField(controller: _nameController),
        FilledButton(onPressed: _next, child: const Text('Next')),
      ],
    );
  }

  Widget _buildHandleStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Handle'),
        TextField(controller: _handleController),
        Row(
          children: [
            TextButton(onPressed: _back, child: const Text('Back')),
            FilledButton(onPressed: _finish, child: const Text('Finish')),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _handleController.dispose();
    super.dispose();
  }
}
