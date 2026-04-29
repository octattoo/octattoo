import 'package:flutter/material.dart';

import 'customer_form_validator.dart';

class CustomerFormScreen extends StatefulWidget {
  const CustomerFormScreen({super.key});

  @override
  State<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends State<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Client')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: CustomerFormValidator.validateName,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: CustomerFormValidator.validateEmail,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _submit,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    // Cross-field validation
    final contactError = CustomerFormValidator.validateContact(
      email: _emailController.text.isEmpty ? null : _emailController.text,
      phone: _phoneController.text.isEmpty ? null : _phoneController.text,
    );
    if (contactError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(contactError)),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      // TODO: call endpoint
      Navigator.of(context).pop();
    }
  }
}
