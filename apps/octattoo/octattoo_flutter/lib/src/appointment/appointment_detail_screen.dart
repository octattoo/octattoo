import 'package:flutter/material.dart';

import 'appointment_detail_viewmodel.dart';

class AppointmentDetailScreen extends StatefulWidget {
  const AppointmentDetailScreen({super.key});

  @override
  State<AppointmentDetailScreen> createState() =>
      _AppointmentDetailScreenState();
}

class _AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  final _viewModel = AppointmentDetailViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        final appt = _viewModel.appointment;
        if (appt == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appt.customerName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text('Type: ${appt.type}'),
              Text('Status: ${appt.status}'),
              if (appt.notes != null) Text('Notes: ${appt.notes}'),
              const SizedBox(height: 24),
              _buildActions(),
              const SizedBox(height: 24),
              Text(
                'Materials',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              ..._viewModel.materials.map(
                (m) => ListTile(
                  dense: true,
                  title: Text(m.productName),
                  subtitle: Text('${m.manufacturer} — ${m.batchNumber}'),
                ),
              ),
              if (_viewModel.materials.isEmpty)
                const Text('No materials recorded'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActions() {
    return Wrap(
      spacing: 8,
      children: [
        if (_viewModel.canStart)
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start'),
          ),
        if (_viewModel.canRecordMaterial)
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Record Material'),
          ),
        if (_viewModel.canFinalize)
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.check),
            label: const Text('Finalize'),
          ),
      ],
    );
  }
}
