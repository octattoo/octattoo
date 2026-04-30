import 'package:flutter/material.dart';

import 'recall_search_viewmodel.dart';

class RecallSearchScreen extends StatefulWidget {
  const RecallSearchScreen({super.key});

  @override
  State<RecallSearchScreen> createState() => _RecallSearchScreenState();
}

class _RecallSearchScreenState extends State<RecallSearchScreen> {
  final _viewModel = RecallSearchViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recall Search')),
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Batch number',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _viewModel.updateBatchNumber,
                  onSubmitted: (_) {
                    // TODO: call server search
                  },
                ),
              ),
              Expanded(
                child: _viewModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _viewModel.results.isEmpty
                        ? const Center(
                            child: Text('Enter a batch number to search'),
                          )
                        : _buildResultsList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildResultsList() {
    final grouped = _viewModel.resultsByProfile;
    return ListView(
      children: [
        for (final entry in grouped.entries) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              entry.key,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          for (final item in entry.value)
            CheckboxListTile(
              title: Text(item.customerName),
              subtitle: Text(
                '${item.customerContact} • ${item.appointmentDate.toLocal().toString().split(' ').first}',
              ),
              value: item.contacted,
              onChanged: (_) => _viewModel.toggleContacted(item.appointmentId),
            ),
        ],
      ],
    );
  }
}
