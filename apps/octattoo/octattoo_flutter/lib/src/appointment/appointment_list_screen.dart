import 'package:flutter/material.dart';

import 'appointment_detail_viewmodel.dart';

class AppointmentListScreen extends StatefulWidget {
  const AppointmentListScreen({super.key});

  @override
  State<AppointmentListScreen> createState() => _AppointmentListScreenState();
}

class _AppointmentListScreenState extends State<AppointmentListScreen> {
  final List<AppointmentDetail> _appointments = [];
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_appointments.isEmpty) {
      return const Center(child: Text('No appointments yet'));
    }

    return ListView.builder(
      itemCount: _appointments.length,
      itemBuilder: (context, index) {
        final appt = _appointments[index];
        return ListTile(
          leading: _statusIcon(appt.status),
          title: Text('${appt.customerName} — ${appt.type}'),
          subtitle: Text(_formatDate(appt.scheduledAt)),
          trailing: _statusBadge(context, appt.status),
        );
      },
    );
  }

  Widget _statusIcon(String status) {
    return switch (status) {
      'scheduled' => const Icon(Icons.schedule),
      'inProgress' => const Icon(Icons.play_circle, color: Colors.orange),
      'finalized' => const Icon(Icons.check_circle, color: Colors.green),
      _ => const Icon(Icons.help_outline),
    };
  }

  Widget _statusBadge(BuildContext context, String status) {
    final (label, color) = switch (status) {
      'scheduled' => ('Scheduled', Theme.of(context).colorScheme.secondary),
      'inProgress' => ('In Progress', Colors.orange),
      'finalized' => ('Finalized', Colors.green),
      _ => ('Unknown', Colors.grey),
    };
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 12)),
      backgroundColor: color.withValues(alpha: 0.15),
      side: BorderSide.none,
      padding: EdgeInsets.zero,
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}
