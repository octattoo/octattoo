import 'package:flutter/material.dart';

import 'inventory_list_viewmodel.dart';
import 'material_form_validator.dart';

class MaterialFormScreen extends StatefulWidget {
  const MaterialFormScreen({super.key});

  @override
  State<MaterialFormScreen> createState() => _MaterialFormScreenState();
}

class _MaterialFormScreenState extends State<MaterialFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _manufacturerController = TextEditingController();
  final _supplierController = TextEditingController();
  final _productNameController = TextEditingController();
  final _batchNumberController = TextEditingController();
  final _quantityController = TextEditingController();

  MaterialTypeFilter _type = MaterialTypeFilter.ink;
  DateTime? _expirationDate;

  @override
  void dispose() {
    _manufacturerController.dispose();
    _supplierController.dispose();
    _productNameController.dispose();
    _batchNumberController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Material')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SegmentedButton<MaterialTypeFilter>(
              segments: const [
                ButtonSegment(
                  value: MaterialTypeFilter.ink,
                  label: Text('Ink'),
                ),
                ButtonSegment(
                  value: MaterialTypeFilter.needle,
                  label: Text('Needle'),
                ),
              ],
              selected: {_type},
              onSelectionChanged: (selected) {
                setState(() => _type = selected.first);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _productNameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
              validator: (v) =>
                  MaterialFormValidator.validateRequired(v, 'Product name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _manufacturerController,
              decoration: const InputDecoration(labelText: 'Manufacturer'),
              validator: (v) =>
                  MaterialFormValidator.validateRequired(v, 'Manufacturer'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _supplierController,
              decoration: const InputDecoration(labelText: 'Supplier'),
              validator: (v) =>
                  MaterialFormValidator.validateRequired(v, 'Supplier'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _batchNumberController,
              decoration: const InputDecoration(labelText: 'Batch Number'),
              validator: (v) =>
                  MaterialFormValidator.validateRequired(v, 'Batch number'),
            ),
            const SizedBox(height: 16),
            if (_type == MaterialTypeFilter.needle) ...[
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    MaterialFormValidator.validateQuantity(v, isNeedle: true),
              ),
              const SizedBox(height: 16),
            ],
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                _expirationDate == null
                    ? 'Select expiration date'
                    : 'Expires: ${_expirationDate!.year}-${_expirationDate!.month.toString().padLeft(2, '0')}-${_expirationDate!.day.toString().padLeft(2, '0')}',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
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

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 365)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
    );
    if (picked != null) {
      setState(() => _expirationDate = picked);
    }
  }

  void _submit() {
    final dateError =
        MaterialFormValidator.validateExpirationDate(_expirationDate);
    if (dateError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(dateError)),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      // TODO: call endpoint
      Navigator.of(context).pop();
    }
  }
}
