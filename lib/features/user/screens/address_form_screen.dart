import 'package:catering_flutter/core/auth_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

import 'package:catering_flutter/features/user/services/address_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressFormScreen extends StatefulWidget {
  final Address? address;

  const AddressFormScreen({super.key, this.address});

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _streetController;
  late TextEditingController _apartmentController;
  late TextEditingController _cityController;
  late TextEditingController _zipCodeController;
  bool _isDefault = false;

  @override
  void initState() {
    super.initState();
    final address = widget.address;
    _firstNameController = TextEditingController(text: address?.firstName);
    _lastNameController = TextEditingController(text: address?.lastName);
    _phoneNumberController = TextEditingController(text: address?.phoneNumber);
    _streetController = TextEditingController(text: address?.street);
    _apartmentController = TextEditingController(text: address?.apartment);
    _cityController = TextEditingController(text: address?.city);
    _zipCodeController = TextEditingController(text: address?.zipCode);
    _isDefault = address?.isDefault ?? false;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _streetController.dispose();
    _apartmentController.dispose();
    _cityController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) return;

    final addressService = context.read<AddressService>();
    final userIri = context.read<AuthService>().userIri;

    try {
      if (userIri != null && widget.address == null) {
        await addressService.createAddress(
          userIri: userIri,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          phoneNumber: _phoneNumberController.text,
          street: _streetController.text,
          apartment: _apartmentController.text.isEmpty
              ? null
              : _apartmentController.text,
          city: _cityController.text,
          zipCode: _zipCodeController.text,
          isDefault: _isDefault,
        );
      } else {
        await addressService.updateAddress(
          id: widget.address!.id,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          phoneNumber: _phoneNumberController.text,
          street: _streetController.text,
          apartment: _apartmentController.text.isEmpty
              ? null
              : _apartmentController.text,
          city: _cityController.text,
          zipCode: _zipCodeController.text,
          isDefault: _isDefault,
        );
      }

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        UIErrorHandler.handleError(context, e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.address == null ? 'Add Address' : 'Edit Address',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 500;
                  final firstNameField = TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Required' : null,
                  );
                  final lastNameField = TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Required' : null,
                  );
                  return isWide
                      ? Row(
                          children: [
                            Expanded(child: firstNameField),
                            const SizedBox(width: 16),
                            Expanded(child: lastNameField),
                          ],
                        )
                      : Column(
                          children: [
                            firstNameField,
                            const SizedBox(height: 16),
                            lastNameField,
                          ],
                        );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _streetController,
                decoration: const InputDecoration(labelText: 'Street Address'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _apartmentController,
                decoration: const InputDecoration(
                  labelText: 'Apartment / Unit (Optional)',
                ),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 500;
                  final cityField = TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(labelText: 'City'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Required' : null,
                  );
                  final zipCodeField = TextFormField(
                    controller: _zipCodeController,
                    decoration: const InputDecoration(labelText: 'Zip Code'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Required' : null,
                  );
                  return isWide
                      ? Row(
                          children: [
                            Expanded(child: cityField),
                            const SizedBox(width: 16),
                            Expanded(child: zipCodeField),
                          ],
                        )
                      : Column(
                          children: [
                            cityField,
                            const SizedBox(height: 16),
                            zipCodeField,
                          ],
                        );
                },
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Set as default address'),
                value: _isDefault,
                onChanged: (value) {
                  setState(() {
                    _isDefault = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              Consumer<AddressService>(
                builder: (context, service, child) {
                  return FilledButton(
                    onPressed: service.isLoading ? null : _saveAddress,
                    child: service.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            widget.address == null
                                ? 'Add Address'
                                : 'Save Changes',
                          ),
                  );
                },
              ),
              if (widget.address != null) ...[
                const SizedBox(height: 16),
                Consumer<AddressService>(
                  builder: (consumerContext, service, child) {
                    return OutlinedButton(
                      onPressed: service.isLoading
                          ? null
                          : () async {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Address'),
                                  content: const Text(
                                    'Are you sure you want to delete this address?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                              );

                              if (confirmed == true && mounted) {
                                try {
                                  await service.deleteAddress(
                                    widget.address!.id,
                                  );
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    UIErrorHandler.handleError(context, e);
                                  }
                                }
                              }
                            },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.error,
                      ),
                      child: const Text('Delete Address'),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
