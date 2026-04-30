import 'package:flutter/material.dart';

/// A contextual "Get started" prompt shown when a section is empty.
/// Auto-hides when [isEmpty] is false. Can be manually dismissed.
class GetStartedPrompt extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isEmpty;
  final VoidCallback? onAction;
  final String? actionLabel;

  const GetStartedPrompt({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isEmpty,
    this.onAction,
    this.actionLabel,
  });

  @override
  State<GetStartedPrompt> createState() => _GetStartedPromptState();
}

class _GetStartedPromptState extends State<GetStartedPrompt> {
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.isEmpty || _dismissed) return const SizedBox.shrink();

    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 48, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(widget.title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.onAction != null)
                  FilledButton(
                    onPressed: widget.onAction,
                    child: Text(widget.actionLabel ?? 'Get started'),
                  ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () => setState(() => _dismissed = true),
                  child: const Text('Dismiss'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
