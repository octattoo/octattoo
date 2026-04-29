import 'package:flutter/material.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key, required this.customerId});

  final String customerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Client Details')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('—'),
            SizedBox(height: 16),
            Text('Contact', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('—'),
            SizedBox(height: 16),
            Text('Notes', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('—'),
            SizedBox(height: 24),
            Text(
              'Relationship History',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('No history yet'),
          ],
        ),
      ),
    );
  }
}
