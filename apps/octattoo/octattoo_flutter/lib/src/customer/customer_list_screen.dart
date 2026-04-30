import 'package:flutter/material.dart';

import '../common/get_started_prompt.dart';
import 'customer_list_viewmodel.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final _viewModel = CustomerListViewModel();

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
                hintText: 'Search clients...',
                onChanged: _viewModel.updateSearch,
                leading: const Icon(Icons.search),
              ),
            ),
            Expanded(
              child: _viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _viewModel.filteredCustomers.isEmpty
                  ? const GetStartedPrompt(
                      title: 'No clients yet',
                      description: 'Add your first client to start managing appointments and projects.',
                      icon: Icons.people,
                      isEmpty: true,
                    )
                  : ListView.builder(
                      itemCount: _viewModel.filteredCustomers.length,
                      itemBuilder: (context, index) {
                        final customer = _viewModel.filteredCustomers[index];
                        return ListTile(
                          title: Text(customer.name),
                          subtitle: Text(customer.subtitle),
                          onTap: () {
                            // TODO: navigate to detail
                          },
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
