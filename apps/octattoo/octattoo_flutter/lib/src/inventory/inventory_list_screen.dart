import 'package:flutter/material.dart';

import 'inventory_list_viewmodel.dart';

class InventoryListScreen extends StatefulWidget {
  const InventoryListScreen({super.key});

  @override
  State<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  final _viewModel = InventoryListViewModel();

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
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SearchBar(
                hintText: 'Search materials...',
                onChanged: _viewModel.updateSearch,
                leading: const Icon(Icons.search),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SegmentedButton<MaterialTypeFilter>(
                segments: const [
                  ButtonSegment(
                    value: MaterialTypeFilter.all,
                    label: Text('All'),
                  ),
                  ButtonSegment(
                    value: MaterialTypeFilter.ink,
                    label: Text('Ink'),
                  ),
                  ButtonSegment(
                    value: MaterialTypeFilter.needle,
                    label: Text('Needle'),
                  ),
                ],
                selected: {_viewModel.typeFilter},
                onSelectionChanged: (selected) {
                  _viewModel.updateTypeFilter(selected.first);
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _viewModel.filteredMaterials.isEmpty
                      ? const Center(child: Text('No materials found'))
                      : ListView.builder(
                          itemCount: _viewModel.filteredMaterials.length,
                          itemBuilder: (context, index) {
                            final item = _viewModel.filteredMaterials[index];
                            return ListTile(
                              title: Text(item.productName),
                              subtitle: Text(
                                '${item.manufacturer} • ${item.batchNumber}',
                              ),
                              trailing: _buildTrailing(item),
                            );
                          },
                        ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTrailing(MaterialListItem item) {
    if (item.type == MaterialTypeFilter.needle) {
      return Text('×${item.quantity ?? 0}');
    }
    return Icon(
      item.status == 'inStock' ? Icons.circle : Icons.circle_outlined,
      color: item.status == 'inStock' ? Colors.green : Colors.grey,
      size: 16,
    );
  }
}
